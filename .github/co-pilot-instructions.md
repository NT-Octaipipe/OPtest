### BDD Scenarios
When suggesting BDD scenarios, use the Screenplay - have named actors performing Tasks and asking Questions.
Limit the number of steps in each scenario to below 6. Avoid using "And" steps where possible.
When defining scenarios, consider the following:
- Use a mix of inputs
- Use input values at the edges of allowed ranges
- Exercise the full lifecycle of any process or entity
- Use amounts of zero, one and many
- Interrupt processes
- Use nonsense inputs

### Step definitions
Step definitions will use the Serenity/JS framework.
Step definitions should have an Actor parameter and be a single-line arrow function, without curly braces.
Step definitions will defer the logic of steps and questions to objects and methods in the /test folder

### Test support functions
Define the logic of Task and Question interactions using object definitions in the /test folder
Direct interactions with the UI will be defined as separate objects and methods. See the /test/ace-ui folder for examples