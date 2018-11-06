Feature: Conversational Clock

  The conversational clock renders the current time in colloquial English.
  Here are some examples of what the Conversational Clock should tell, depending on the time of the day:
  {Examples} Should tell the time in a conversational way

  You can see more detailed examples in the scenarios listed below.

  #
  # This scenario gives a high level overview of what the application does.
  # Note that this summarises the requirements from a business perspective (it is the end goal),
  # but it may not be the order you want to build things from a technical perspective.
  #
  Scenario Outline: Should tell the time in a conversational way
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time        |
      | 01:00        | it's one o'clock           |
      | 06:30        | it's half past six         |
      | 14:45        | it's a quarter to three    |
      | 13:58        | it's almost two o'clock    |
      | 15:04        | it's juat past two o'clock |

  #
  # The following scenarios explore different aspects of the requirements in more detail.
  # These scenarios can be used to guide the TDD development process, and would be used by QA
  # to verify edge cases and so on. You can add more scenarios to these ones as you go.
  #
  # Note that not all your TDD scenarios would be written in this case - the more granular and lower level
  # functionality should be illustrated and tested using lower level unit tests.
  #
  Scenario Outline: Should say "o'clock" on the hour
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time |
      | 01:00        | it's one o'clock    |
      | 09:00        | it's nine o'clock   |
      | 12:00        | it's twelve o'clock |

  Scenario Outline: Should use 12-hour time
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time |
      | 01:00        | it's one o'clock    |
      | 13:00        | it's one o'clock    |
      | 0:00         | it's midnight       |

  Scenario Outline: Should use English numbers for minutes and hours
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time |
      | 01:13        | it's one thirteen   |
      | 17:40        | it's five fourty    |

  Scenario Outline: Should say "half past", "a quarter past" and "a quarter to"
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time     |
      | 01:15        | it's a quarter past one |
      | 02:30        | it's half past two      |
      | 04:45        | it's a quarter to five  |

  Scenario Outline: Should say "ten past" and "ten to"
    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time |
      | 05:10        | it's ten past five  |
      | 02:50        | it's ten to three   |

  Scenario Outline: Should say 'almost' and 'just past' when it is close to the hour
  'Almost' and 'just past' should be used if the time is less than 5 minutes on either side of the hour

    When the current time is <Current Time>
    Then the conversational time should be <Conversational Time>
    Examples:
      | Current Time | Conversational Time        |
      | 12:55        | it's five to one           |
      | 12:56        | it's almost one o'clock    |
      | 12:59        | it's almost one o'clock    |
      | 01:00        | it's one o'clock           |
      | 01:01        | it's just past one o'clock |
      | 01:04        | it's five past one         |

