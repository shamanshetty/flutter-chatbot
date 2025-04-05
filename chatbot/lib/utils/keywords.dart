class Keywords {
  // Map of keywords to their synonyms
  Map<String, List<String>> getSynonyms() {
    return {
      'market': ['price', 'rate', 'sell', 'selling', 'mandi', 'bazaar', 'market price'],
      'crop': ['plant', 'seed', 'farming', 'cultivation', 'agriculture', 'grow', 'harvest'],
      'loan': ['credit', 'finance', 'money', 'borrow', 'debt', 'bank', 'kcc', 'kisan credit'],
      'subsidy': ['support', 'assistance', 'help', 'aid', 'grant', 'discount', 'scheme'],
      'insurance': ['cover', 'protection', 'security', 'fasal bima', 'crop insurance', 'pmfby'],
      'weather': ['climate', 'rain', 'forecast', 'monsoon', 'temperature', 'season'],
      'helpline': ['contact', 'phone', 'call', 'support', 'help', 'assistance', 'number'],
    };
  }

  // List of common crops in India
  List<String> getCrops() {
    return [
      'rice', 'paddy', 'wheat', 'cotton', 'sugarcane', 'maize', 'corn',
      'soybean', 'potato', 'onion', 'tomato', 'groundnut', 'mustard',
      'pulses', 'dal', 'lentil', 'chana', 'gram', 'millet', 'bajra', 'jowar'
    ];
  }

  // List of common locations/states
  List<String> getStates() {
    return [
      'punjab', 'haryana', 'uttar pradesh', 'bihar', 'west bengal',
      'odisha', 'maharashtra', 'gujarat', 'madhya pradesh', 'rajasthan',
      'karnataka', 'andhra pradesh', 'telangana', 'tamil nadu', 'kerala'
    ];
  }
}