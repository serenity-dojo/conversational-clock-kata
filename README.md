# Talking Clock Kata

The goal of this code kata is to design a Conversational Clock - a small application capable of telling the current system time in a conversational format.

## The problem domain

Here are several examples of what the Conversational Clock should tell, depending on the time of the day:

| Time              | Expected Output                 |
| :---              | :---                            |
| 01:00 and 13:00   | it's one o'clock                |
| 08:07             | it's seven past eight           |
| 12:00             | it's noon                       |
| 24:00             | it's midnight                   |
| 02:30             | it's half past three            |
| 14:50             | it's ten to three               |
| 14:45             | it's a quarter to three         |
| 13:58             | it's almost two o'clock         |
| 14:01             | it's just past two o'clock     |

In the `src/test/features` you will find a Cucumber feature file that describes these initial requirements. 

## Design

The Conversational Clock should:
- know the current system time
- tell the current time using a conversational format, as described above
- provide an API allowing the Conversational Clock to be:
  - instantiated with any dependencies
    that it may need, such as `new ConversationalClock(new SystemTime())`
  - asked for the current time using a parameter-less method, such as `clock.currentTime()`,
  responding with a `String`

### Things to consider

- Things like the time, random number generators, etc. are typically outside of our control.
  So here's the first puzzle: how can we test-drive the design of the Conversational Clock
  without having to wait with running our tests until a specific time of the day?
    - Have a look at the `ConversationalClockTest`
    - Note that the Conversational Clock relies on the time reading provided by the `SystemTime` object.
    - How can you modify the values returned by the `SystemTime` object? Do you need to change the implementation
      of the class?
- Now that you can control the time, it's worth noticing that
  some of the examples of the expected behaviour listed above seem to be easier to implement than others:
    1. Consider starting with making the Clock tell the time on an hour ("it's one o'clock", "it's two o'clock")
    2. Add support for telling the time with a minute precision ("it's seven past eight", "it's fifty three past five")
    3. Make the responses a bit more human: "it's a quarter past three" instead of "it's fifteen past three",
    "it's midnight" instead of "it's zero o'clock" and so on
    4. Make the Clock tell the time relative to the hour that's "closer" -
    "it's seven to nine" instead of "it's eight fifty three"
    5. To make things more interesting you can consider adding "fuzzy responses",
    such as: "it's just after two" instead of "14:01", "it's almost three" instead of "14:58"
- Remember to look for opportunities to refactor both the tests and the Conversational Clock as soon as the tests
turn green
- Think about "how much testing is enough"? Do you need to test every single possible hour/minute combination?
What's the cost if you do? What are the consequences if you don't?


## Working with this repository

The starter project works with both Maven and Gradle, running on Java 8 or higher.

### Use Maven

Open a command window and run:

    mvn clean verify

This runs Cucumber features using Cucumber's JUnit runner. The `@RunWith(CucumberWithSerenity.class)` annotation on the `CucumberTestSuite`
class tells JUnit to kick off Cucumber.

### Use Gradle

Open a command window and run:

    gradlew test aggregate

This runs Cucumber features using Cucumber's JUnit runner. The `@RunWith(CucumberWithSerenity.class)` annotation on the `CucumberTestSuite`
class tells JUnit to kick off Cucumber.

### Viewing the reports

Both of the commands provided above will produce a Serenity test report in the `target/site/serenity` directory. 
