class ResponseDatabase {
  // Map of keywords to responses
  final Map<String, String> _responses = {
    'market': 'The current market rates for common crops are:\n'
        '- Rice: ₹1,940 per quintal\n'
        '- Wheat: ₹2,125 per quintal\n'
        '- Cotton: ₹6,380 per quintal\n'
        'For more specific rates, please mention your crop and district.',
    'crop': 'For crop-related advice, please specify your crop and location. '
        'I can provide information on seeds, fertilizers, pest control, and yield improvement.',
    'loan': 'Kisan Credit Card (KCC) offers loans at 4% interest rate for farmers. '
        'PM-KISAN scheme provides ₹6,000 annually in three installments. '
        'For bank-specific schemes, mention your bank name.',
    'subsidy': 'Current subsidies include:\n'
        '- PM-KISAN: ₹6,000 annual support\n'
        '- Fertilizer subsidy: Upto 70% on various fertilizers\n'
        '- Machinery subsidy: 50% for small farmers under Farm Mechanization scheme\n'
        'For application process, type "apply subsidy"',
    'insurance': 'Pradhan Mantri Fasal Bima Yojana (PMFBY) provides crop insurance with minimal premium. '
        'Premium rates: 1.5% for rabi crops, 2% for kharif crops.',
    'weather': 'For weather forecasts specific to your region, please type "weather" followed by your district name.',
    'help': 'You can ask me about:\n'
        '- Market prices (type "market")\n'
        '- Crop advice (type "crop" followed by crop name)\n'
        '- Loans and schemes (type "loan" or bank name)\n'
        '- Subsidies (type "subsidy")\n'
        '- Insurance (type "insurance")\n'
        '- Weather forecast (type "weather")\n'
        '- Government helplines (type "helpline")',
    'helpline': 'Kisan Call Center: 1800-180-1551\n'
        'PM-KISAN Helpline: 1800-115-526\n'
        'Agricultural Extension Helpline: 1800-425-1556',
  };

  // Map of crops to specific information
  final Map<String, String> _cropInfo = {
    'rice': 'For rice cultivation:\n'
        '- Recommended varieties: MTU 7029, IR 64, Swarna\n'
        '- Seed rate: 60-80 kg/hectare\n'
        '- Current MSP: ₹1,940/quintal\n'
        '- Govt schemes: PM-KISAN, PMFBY',
    'wheat': 'For wheat cultivation:\n'
        '- Recommended varieties: HD 2967, PBW 343, DBW 17\n'
        '- Seed rate: 100-125 kg/hectare\n'
        '- Current MSP: ₹2,125/quintal\n'
        '- Govt schemes: PM-KISAN, PMFBY',
    'cotton': 'For cotton cultivation:\n'
        '- Recommended varieties: Bt Cotton hybrids, Suraj, LRA 5166\n'
        '- Seed rate: 2.0-2.5 kg/hectare\n'
        '- Current MSP: ₹6,380/quintal\n'
        '- Govt schemes: PM-KISAN, PMFBY',
  };

  // Returns a response based on the query
  String? getResponseForQuery(String query) {
    // Check for exact keyword matches
    for (String key in _responses.keys) {
      if (query.contains(key)) {
        return _responses[key];
      }
    }
    return null;
  }

  // Returns information for a specific crop
  String getCropSpecificInfo(String crop) {
    return _cropInfo[crop] ?? 'No specific information available for $crop.';
  }
}