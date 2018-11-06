package com.db.satl.katas.clock;

import com.db.satl.katas.clock.converters.LocalTimeConverter;
import cucumber.api.CucumberOptions;
import cucumber.api.PendingException;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
//import cucumber.deps.com.thoughtworks.xstream.annotations.XStreamConverter;
//import cucumber.deps.com.thoughtworks.xstream.annotations.XStreamConverters;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

import java.time.LocalDateTime;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
        features = "src/test/resources/features"
)
public class CucumberTestSuite {}
