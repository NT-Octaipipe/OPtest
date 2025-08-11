Feature: LLM explainer correctness

  Scenario Outline: LLM explainer references custom SLA limits
    Given <actor> configures custom SLA limits
    When <actor> runs the LLM explainer
    Then <actor> should see references to the correct limits

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: LLM explainer uses correct temperature names
    Given <actor> runs the LLM explainer with temperature names
      | name      |
      | <temp>    |
    When <actor> checks the explanation
    Then <actor> should see correct temperature naming

    Examples:
      | actor   | temp      |
      | Carol   | inlet     |
      | Dave    | exhaust   |

  Scenario Outline: LLM explainer uses consistent HVAC terminology
    Given <actor> reviews explanations containing "HVAC system"
    When <actor> updates terminology
    Then <actor> should see consistent use of terms

    Examples:
      | actor   |
      | Eve     |
      | Frank   |
