package com.db.satl.katas.clock;

import com.db.satl.katas.clock.converters.LocalTimeConverter;
import cucumber.api.PendingException;
import cucumber.api.Transform;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Pending;

import java.time.LocalDateTime;
import java.time.LocalTime;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * This are some sample step definitions to get you started.
 * You can refactor the ConversationalClock in any way you see fit.
 */
public class ClockStepDefinitions {

    String consersationalTime;
    ConversationalClock clock = new ConversationalClock();

    @When("^the current time is (.*)$")
    public void the_current_time_is(@Transform(LocalTimeConverter.class) LocalTime currentTime) {
        // TODO: Make this work
        // consersationalTime = clock.???
    }

    @Then("^the conversational time should be (.*)$")
    public void the_conversational_time_should_be(String expectedConversationalTime) {
        throw new PendingException();
//      TODO: Uncomment the following line to get your tests to work.
//        assertThat(consersationalTime).isEqualTo(expectedConversationalTime);
    }
}
