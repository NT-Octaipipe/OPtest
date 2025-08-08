Feature: Manage Site
  As a Facility Manager, I want to:
    View my site performance
    View my site projections
    Configure the system
    Manage the Cooling AI
    Manage Cooling Approval
    View Cooling SLAs

  Background:
    Given Felicity has opened their portal

  Scenario: Facility Manager sees current ESG metrics
    When they check their "Current" ESG
    Then they see that the ESG data is correct
      | ESG | Expected Value |
      | PUE |          1.190 |
      | WUE |          0.000 |
      | CUE |          0.847 |

  Scenario: Facility Manager sees ESG trend metrics
    When they check their "Trend" ESG
    Then they see that the ESG data is correct
      | ESG | Expected Value |
      | PUE |          1.191 |
      | WUE |          0.000 |
      | CUE |          0.849 |
