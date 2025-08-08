import { Task } from "@serenity-js/core";
import { By, Click, Enter, Navigate, PageElement } from "@serenity-js/web";
import '@dotenvx/dotenvx/config'

export const User = {
    login: () =>
        Task.where(`#actor logs in`,
            Navigate.to('/'),
            Enter.theValue(process.env.TEST_ACE_UI_USER).into(LoginForm.email()),
            Enter.theValue(process.env.TEST_ACE_UI_PASSWORD).into(LoginForm.password()),
            Click.on(LoginForm.submitButton())
        ),
}

const LoginForm = {

    email: () =>
        PageElement.located(By.css('input[name="username"]'))
            .describedAs('email input'),

    password: () =>
        PageElement.located(By.css('input[name="password"]'))
            .describedAs('password input'),

    submitButton: () =>
        PageElement.located(By.css('button[type="submit"]'))
            .describedAs('sign in button'),
};

