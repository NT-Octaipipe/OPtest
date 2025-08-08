import { DataTable } from "@cucumber/cucumber";
import { Ensure, equals } from "@serenity-js/assertions";
import { List, Task } from "@serenity-js/core";
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
                        item["Expected Value"],
                        equals(ESG_widget.metric_value(item[metric]))
                    )
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