Feature: Submitting a guess
  Scenario Outline: submit a guess
    Given the solution is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Scenarios: there are no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

    Scenarios: there is 1 correct match
      | code | guess | mark |
      | 1234 | 1555  | +    |
      | 1234 | 2555  | -    |
    
    Scenarios: there are 2 correct matches
      | code | guess | mark |
      | 1234 | 1255  | ++   |
      | 1234 | 1355  | +-   |
      | 1234 | 3155  | --   |

    Scenarios: there are 3 correct matches
      | code | guess | mark |
      | 1234 | 1235  | +++  |
      | 1234 | 1245  | ++-  |
      | 1234 | 1325  | +--  |
      | 1234 | 4325  | ---  |

    Scenarios: there are 4 correct matches
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 4231  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |

    

