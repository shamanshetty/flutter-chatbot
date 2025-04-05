import 'package:flutter/material.dart';
import '../../services/response_service/response_database.dart';
import '../../utils/query_processor.dart';

class ResponseHandler {
  final ResponseDatabase _responseDatabase = ResponseDatabase();
  final QueryProcessor _queryProcessor = QueryProcessor();

  String getResponse(String query) {
    // Default response if no match is found
    String response = 'I don\'t understand. Please try asking about market prices, crops, loans, subsidies, or type "help" for assistance.';

    // Process the query to extract keywords
    String processedQuery = _queryProcessor.processQuery(query);

    // Get matching response based on keywords
    String? matchedResponse = _responseDatabase.getResponseForQuery(processedQuery);

    if (matchedResponse != null) {
      response = matchedResponse;
    }

    // Handle specific crop queries
    if (processedQuery.contains('rice') || processedQuery.contains('paddy')) {
      response = _responseDatabase.getCropSpecificInfo('rice');
    } else if (processedQuery.contains('wheat')) {
      response = _responseDatabase.getCropSpecificInfo('wheat');
    } else if (processedQuery.contains('cotton')) {
      response = _responseDatabase.getCropSpecificInfo('cotton');
    }

    return response;
  }
}