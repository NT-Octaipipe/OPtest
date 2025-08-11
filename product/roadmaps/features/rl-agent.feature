Feature: RL Agent operations

  Scenario Outline: RL Agent moves temperature and humidity over timesteps
    Given <actor> configures the RL agent
    When the agent optimises temperature to <temp> and humidity to <humidity> over <timesteps> timesteps
    Then the environment should remain within SLA

    Examples:
      | actor   | temp | humidity | timesteps |
      | Alice   | 18   | 40       | 5         |
      | Bob     | 25   | 60       | 10        |
      | Carol   | 30   | 80       | 1         |

  Scenario: RL Agent outputs setpoint changes via Modbus
    Given Dave configures Modbus integration
    When the RL agent outputs a setpoint change
    Then the change should be sent to the BMS via Modbus

  Scenario: Add FRL capabilities to RL agent
    Given Eve enables federated RL
    When the RL agent trains across multiple sites
    Then the agent should update its global model

  Scenario: Train RL Agent in ACE deployment
    Given Frank deploys the RL agent in ACE
    When Frank starts training
    Then the agent should learn optimal setpoints for the environment
