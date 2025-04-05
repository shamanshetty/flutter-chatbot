import 'keywords.dart';

class QueryProcessor {
  final Keywords _keywords = Keywords();

  String processQuery(String query) {
    // Convert to lowercase for case-insensitive matching
    String processedQuery = query.toLowerCase();

    // Remove extra whitespace
    processedQuery = processedQuery.trim();

    // Check for synonyms and replace with standard keywords
    for (String keyword in _keywords.getSynonyms().keys) {
      List<String> synonyms = _keywords.getSynonyms()[keyword] ?? [];
      for (String synonym in synonyms) {
        if (processedQuery.contains(synonym)) {
          // Found a synonym, augment with the standard keyword
          // This helps in matching the query against the response database
          if (!processedQuery.contains(keyword)) {
            processedQuery += ' $keyword';
          }
        }
      }
    }

    return processedQuery;
  }

  // Extract entities like crop names, locations, etc.
  Map<String, String> extractEntities(String query) {
    Map<String, String> entities = {};

    // Extract crop names
    for (String crop in _keywords.getCrops()) {
      if (query.contains(crop)) {
        entities['crop'] = crop;
        break;
      }
    }

    // Future: Add more entity extraction like location, bank names, etc.

    return entities;
  }
}