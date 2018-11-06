package com.db.satl.katas.clock.converters;

import cucumber.api.Transformer;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class LocalTimeConverter extends Transformer<LocalTime>{

    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("H:mm");

    @Override
    public LocalTime transform(String value) {
        return LocalTime.parse(value, TIME_FORMATTER);
    }
}
