1. Confirm the forecast line query is using the correct timepoint for rendering impact line
    - Verified the query logic for the forecast line.
    - Checked the rendered impact line against expected timepoints in the UI.
    - Compared results before and after the fix to ensure correctness.
2. Activity log filters don't appear to work consistently
    - Applied various filter combinations in the activity log.
    - Checked that the displayed results matched the selected filters.
    - Tested edge cases (e.g., no results, all results) to confirm consistent behavior.
3. Floor plan SLA indicators not showing true SLA status for zone
    - Loaded different floor plans and zones.
    - Compared SLA indicator status in the UI with backend data.
    - Simulated SLA status changes and verified real-time updates.
4. Change centre status energy saving to use same endpoint as operational savings
    - Updated the endpoint in the codebase.
    - Triggered centre status updates and monitored API calls.
    - Confirmed that energy and operational savings now use the same data source.
5. Fix undefined in completion rate
    - Reproduced the issue to observe the "undefined" value.
    - Applied the fix and retested completion rate calculations.
    - Checked various scenarios to ensure no "undefined" values appear.
6. Power Forecast graph breaks down around midnight
    - Ran the forecast graph across midnight time boundaries.
    - Observed for any breakdowns or errors in the graph rendering.
    - Validated that the graph displays correctly before and after midnight.
7. Investigate why Impact graph is showing nothing in Italtel
    - Loaded the Impact graph with Italtel data.
    - Checked data flow and API responses.
    - Identified and fixed the root cause, then confirmed the graph displays as expected.
8. Power forecast hover text hard to find
    - Hovered over various points on the power forecast graph.
    - Adjusted UI/UX as needed to improve visibility.
    - Confirmed that hover text is now easily accessible.
9. Accepting recommendation from 'See Our Logic' results in 'Rejected' text
    - Followed the recommendation acceptance workflow.
    - Observed the resulting status text.
    - Ensured that accepting a recommendation no longer shows "Rejected".
10. Activity log should record actions according to the logged in user
    - Performed actions as different users.
    - Checked the activity log entries for correct user attribution.
    - Validated against backend logs if needed.
11. Language inconsistency in different screens for energy savings and SLA status
    - Reviewed UI text across relevant screens.
    - Standardized language for consistency.
    - Retested to ensure all screens reflect the changes.
12. Replace default building control baseline with config based baseline
    - Updated the baseline logic to use configuration.
    - Ran scenarios with different config values.
    - Verified that the baseline updates as per configuration.
13. Energy Forecast graph should plot consumption bin with [End] on x axis
    - Checked the x-axis labeling on the Energy Forecast graph.
    - Ensured that the "End" label appears correctly.
    - Validated with different data sets.
14. Fix manually accepted '%' value propagation
    - Manually accepted percentage values in the UI.
    - Traced the propagation of these values through the system.
    - Confirmed correct display and storage.
15. Optimiser Recommendation header overlaps status summary
    - Viewed the Optimiser Recommendation header in various screen sizes.
    - Adjusted layout to prevent overlap.
    - Retested for visual correctness.
16. Impact, Simulation and SLA node missing from action object for PM02
    - Inspected the action object for PM02.
    - Ensured all required nodes are present after the fix.
    - Validated with sample data.
17. Fix Energy Forecast Graph Labelling Issues
    - Reviewed all labels on the Energy Forecast graph.
    - Corrected any inaccuracies or misplacements.
    - Confirmed labels are clear and accurate.
18. Action consumption endpoint sums values incorrectly
    - Queried the action consumption endpoint with test data.
    - Compared summed values to expected results.
    - Fixed calculation logic and retested.
19. Baseline predictions are generally about 30% lower than actual agent predictions
    - Compared baseline and agent predictions for multiple cases.
    - Investigated calculation discrepancies.
    - Adjusted baseline logic and validated results.
20. Fix missing zone dropdown in Env SLA pane
    - Opened the Env SLA pane and checked for the zone dropdown.
    - Ensured dropdown appears and functions correctly.
    - Tested with multiple zones.
21. Centre Status "Energy use since last viewed"
    - Triggered the "since last viewed" calculation.
    - Checked that the value updates correctly after viewing.
    - Validated with different user sessions.
22. Use of the term HVAC system in explanations
    - Searched for all instances of "HVAC system" in explanations.
    - Updated terminology as needed.
    - Retested to ensure consistency.
23. SLA risk on recommendation does not tie up with Impact screen
    - Compared SLA risk values between recommendation and Impact screen.
    - Fixed any mismatches.
    - Retested for alignment.
24. Completion rate problems and other minor UI issues
    - Identified and listed UI issues.
    - Applied fixes and retested each UI element.
    - Ensured completion rate displays correctly.
25. Energy forecast has wrong stack order
    - Checked the stack order in the energy forecast graph.
    - Adjusted stacking logic.
    - Validated with various data sets.
26. Clamp logic is incorrect, needs refactoring
    - Reviewed and refactored clamp logic.
    - Ran tests to ensure correct clamping behavior.
    - Checked edge cases.
27. Agent request latest Observables from the Observables view which includes forecasts
    - Triggered agent requests for observables.
    - Ensured latest data, including forecasts, is returned.
    - Validated with backend data.
28. Abstracted Mock Data script doesn't work
    - Ran the mock data script.
    - Debugged and fixed errors.
    - Confirmed script runs successfully.
29. LLM explainer should reference custom SLA limits
    - Configured custom SLA limits.
    - Ran the LLM explainer and checked references.
    - Ensured correct limits are used.
30. Impact screen graph incomplete
    - Loaded the Impact screen with various data sets.
    - Checked for completeness of the graph.
    - Fixed data flow or rendering issues.
31. Impact numbers and colours incorrect in popout and SOL sidebar
    - Compared numbers and colours in popout and sidebar.
    - Corrected discrepancies.
    - Retested for accuracy.
32. Activity log should have paging
    - Populated activity log with many entries.
    - Checked paging controls and navigation.
    - Ensured correct entries appear on each page.
33. Show setpoints in same order on display for successive tickets
    - Created multiple tickets with setpoints.
    - Verified display order consistency.
    - Fixed any ordering issues.
34. LLM explainer confuses temperature names
    - Ran LLM explainer with various temperature names.
    - Identified and fixed confusion in naming.
    - Retested for clarity.
35. Activity log should be exportable
    - Used export functionality in the activity log.
    - Checked exported file for completeness and correctness.
    - Validated with different filters and data sets.
36. Comfortable and close boundaries should be configurable not fixed in the SLA plot
    - Made boundaries configurable in the SLA plot.
    - Tested with different configuration values.
    - Ensured plot updates accordingly.