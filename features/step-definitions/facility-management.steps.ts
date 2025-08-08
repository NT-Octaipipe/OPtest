import { DataTable, Given, Then, When } from "@cucumber/cucumber";
import { Actor } from "@serenity-js/core";
import { Navigate } from "@serenity-js/web";
import { User } from "../../test/ace-ui/User";
import { Explainer } from "../../test/ace-ui/Explainer";
import { SLA } from "../../test/ace-api/SLA";
import { ESG } from "../../test/ace-ui/ESG";

// make sure step functions are async and do not wrap the actor clause in {}

Given("{actor} has opened their portal", async (actor: Actor) =>
  actor.attemptsTo(User.login())
);

When("{pronoun} check their {string} ESG", async (actor: Actor, view: string) =>
  actor.attemptsTo(
    Navigate.to("/dashboard/overview"),
    ESG.switchView(view)
  )
);

Then(
  "{pronoun} see(s) that the ESG data is correct",
  async (actor: Actor, data: DataTable) =>
    actor.attemptsTo(
      ESG.compareMetric(data, "KPI"),
    ),
);

// TODO: Update this to use the tabs in See Our Logic from the Zone 1 link on the right of the dashboard
When(
  "{actor} views the {string} Explainer",
  async (actor: Actor, sectionName: string) =>
    actor.attemptsTo(Explainer.getAdvice(sectionName))
);

Then(
  "{actor} sees that the advice includes:",
  async (actor: Actor, advicePoints: DataTable) =>
    actor.attemptsTo(
      Explainer.checkAdviceContainsAllSalientPoints(advicePoints)
    )
);

// TODO: Update this to use the SLA tab in See Our Logic from the Zone 1 link on the right of the dashboard
When("{actor} views the SLA Boundaries", async (actor: Actor) =>
  actor.attemptsTo(SLA.fetchData())
);

Then(
  "{actor} sees that the SLA Zones match:",
  async (actor: Actor, zoneData: DataTable) =>
    actor.attemptsTo(Explainer.checkSLAZonesMatch(zoneData))
);

// TODO: Update this to use the Zone 1 link on the right of the dashboard
When('{actor} accepts the advice about {string}', async (actor: Actor, setPoint: string) =>
  actor.attemptsTo(
    Explainer.chooseAdvice("AgentRecommendation"),
    Explainer.acceptAdvice()
  )
);

Then(
  "{actor} sees that the {string} is set to the Recommended Value",
  async (actor: Actor, setPoint: string) =>
    actor.attemptsTo(
      Explainer.checkSetPointWasUpdated(setPoint)
    )
)
