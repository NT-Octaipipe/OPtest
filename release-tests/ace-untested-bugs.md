1. ACE-117: Improve readability of SLA Boundaries plot
Missing test steps.
Suggested test steps:

Navigate to the “Environment SLA” screen with a recommendation available.

Observe the psychrometric chart for “current” and “projected” state markers.

Check the legend and plot markers for contrast and label consistency.

Confirm that markers are distinguishable and legend matches plot markers.

2. ACE-43: Ensure LLM correctly displays fan and pump speed as a% of full
Missing test steps.
Suggested test steps:

Run the DC system test to generate a recommendation involving fan or pump speed.

Open the recommendation and review the LLM explanation.

Confirm that fan and pump speeds are referenced as percentages (e.g., 50%) rather than decimal fractions (e.g., 0.5).

3. ACE-37: Centre Status "Energy use since last viewed"
Missing test steps.
Suggested test steps:

Navigate to the Centre Status screen.

Locate the “Energy use since last viewed” metric.

Verify the language and meaning are clear and consistent with other energy use metrics.

4. ACE-36: Use of the term HVAC system in explanations
Missing test steps.
Suggested test steps:

Trigger a recommendation that generates an LLM explanation.

Review the explanation text for the presence of the term “HVAC.”

Confirm that “HVAC” is not used in the explanation.

If you need further details for any specific ticket, refer to the test steps in similar tickets, which generally involve:

Navigating to the relevant UI screen.

Performing the action or viewing the element in question.

Verifying the expected behavior or text is present and correct., The following issues do not have explicit test steps ("How to reproduce the error" or similar) defined in their descriptions:

1. ACE-26: Clamp logic is incorrect, needs refactoring
Done
No test steps provided.

Suggested test steps (based on similar logic/bug tickets):

Identify a scenario where the clamp logic should be triggered (e.g., input values at or beyond expected boundaries).

Run the function/module with values that should be clamped.

Verify that the output is correctly clamped and that the logic is only applied once.

Check for redundant code execution by reviewing logs or debugging.

2. ACE-23: LLM explainer should reference custom SLA limits
Done
No test steps provided.

Suggested test steps (based on LLM explainer tickets like ACE-18):

Set custom SLA limits in the system (e.g., via the Configuration.Sla table or API).

Trigger the LLM explainer (e.g., by generating an action summary).

Verify that the explainer references the custom SLA limits in its output, not the ASHRAE standard values.

3. ACE-18: LLM explainer confuses temperature names
Done
No explicit test steps provided, but some guidance in the description.

Suggested test steps (based on description and similar LLM tickets):

Generate explanations using the LLM explainer for various scenarios.

Compare the temperature names and values in the explanation with the actual values in the Environment SLA page.

Confirm that the explainer uses the correct names and values for each temperature type.

All other issues in this batch have clear test steps or "How to reproduce the error" sections.,
Here’s a review of the recent “Done” bugs in the ACE project, focusing on whether they have test steps defined and, where missing, suggestions for how to test them based on similar tickets:

1. ACE-84: Confirm the immediate first step in power forecast is generated correctly
Done
Test steps defined:
Yes. The description includes a “How to reproduce the error” section:

View the power forecast graph for a given timestep.

Expected: Even power consumption across the forecast window.

Actual: Lower power consumption by cooling and other during first step.

No further action needed.

2. ACE-82: Activity log filters don't appear to work consistently
Done
Test steps defined:
Yes. The description includes a “How to reproduce the error” section:

Attempt to use any of the filters on the activity log screen.

Expected: Activity log filtered by the selected filter.

Actual: “Loading …” although the API call does seem to be fetching data.

No further action needed.

3. ACE-18: LLM explainer confuses temperature names
Done
Test steps defined:
Yes. The description includes a “How to reproduce the error” section:

Check explanations by LLM against actual values in Environment SLA page.

Expected: The correct value is used for the correct temp.

Actual: Explainer mixes them up.

No further action needed.

4. ACE-95: Update LLM to use system prompt to reduce amount of data sent for each request
Done
Test steps defined:
No explicit test steps or “How to reproduce” section.

Suggested test steps (based on similar LLM tickets):

Attempt to send a long prompt via the assistants API.

Confirm that the system prompt is sent initially and subsequent requests only send necessary data.

Verify that no connection errors occur due to data size.

Check that the system functions as expected for users submitting long prompts.

5. ACE-99: Save master prompt and token meta data for each request
Done
Test steps defined:
No explicit test steps or “How to reproduce” section.

Suggested test steps (based on similar metadata/logging tickets):

Trigger an LLM request in the system.

Check the database or logs to confirm that the master prompt, model, token, and cost metadata are saved for each request.

Compare the recorded metadata with the actual request to ensure accuracy.

Summary Table

Issue

Test Steps Defined?

Suggested Test Steps (if missing)

ACE-84

Yes

N/A

ACE-82

Yes

N/A

ACE-18

Yes

N/A

ACE-95

No

See above

ACE-99

No

See above