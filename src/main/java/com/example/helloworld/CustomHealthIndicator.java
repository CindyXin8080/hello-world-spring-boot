package com.example.helloworld;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class CustomHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        // Perform custom health checks here
        boolean healthy = true;

        if (healthy) {
            return Health.up().withDetail("status", "Everything is fine!").build();
        } else {
            return Health.down().withDetail("status", "Something is wrong!").build();
        }
    }
}