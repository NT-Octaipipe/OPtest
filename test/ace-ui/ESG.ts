import { DataTable } from "@cucumber/cucumber";
import { Ensure, equals, isCloseTo } from "@serenity-js/assertions";
import { List, Numeric, Task } from "@serenity-js/core";
import { By, Click, PageElement, Text } from "@serenity-js/web";

export const ESG = {
    switchView: (view: string) =>
        Task.where(`#actor switches to ${view} view`,
            Click.on(ESG_widget.viewButton(view))
        ),
    compareMetric: (expectedData: DataTable, metric: string) =>
        Task.where(`#actor compares data to expectations`,
            List.of(expectedData.hashes()).forEach(({ actor, item }) =>
                actor.attemptsTo(
                    Ensure.that(
                        Numeric.floatValue().of(ESG_widget.metric_value(item[metric])),
                        isCloseTo(Numeric.floatValue().of(item["Expected Value"]), 0.002)
                    ),
                )
            )
        ),  
}

const ESG_widget = {
    viewButton: (view: string) =>
        PageElement.located(By.xpath(`//button[.="${view}"]`))
            .describedAs(`button to switch to ${view} view`),
    metric_value: (metric: string) =>
        Text.of(PageElement.located(By.xpath(`//div[@class='row' and contains(.//span,'${metric}')]//span[contains(@class,'value')]`)))
            .describedAs(`${metric} value`),
};