package com.db.satl.katas.clock.converters;

import junitparams.JUnitParamsRunner;
import junitparams.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.time.LocalTime;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(JUnitParamsRunner.class)
public class WhenConvertingLocalTimeParametersInCucumber {
    @Test
    @Parameters({
            "0:00, 0, 0",
            "9:00, 9, 0",
            "9:53, 9, 53",
    })
    public void shouldConvertStringsToLocalTimes(String timeValue, int hour, int minute) {
        LocalTime localTime = new LocalTimeConverter().transform(timeValue);
        assertThat(localTime.getHour()).isEqualTo(hour);
        assertThat(localTime.getMinute()).isEqualTo(minute);
    }
}
