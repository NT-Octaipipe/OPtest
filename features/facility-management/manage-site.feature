Feature: Manage Site
  As a Facility Manager, I want to:
    View my site performance
    View my site projections
    Configure the system
    Manage the Cooling AI
    Manage Cooling Approval
    View Cooling SLAs

  Scenario: Facility Manager sees current KPIs
    Given Felicity has opened their portal
    When they check their "Current" ESG
    Then they see that the ESG data is correct
      | KPI | Expected Value |
      | PUE |          1.190 |
      | WUE |          0.000 |
      | CUE |          0.847 |
