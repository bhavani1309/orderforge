package com.orderforge.service;

import org.springframework.stereotype.Service;

@Service
public class StressService {

    public void startCpuStress() {
        try {
            ProcessBuilder pb = new ProcessBuilder(
                "docker", "run", "--rm",
                "polinux/stress",
                "stress", "--cpu", "2", "--timeout", "60"
            );
            pb.inheritIO();
            pb.start();
        } catch (Exception e) {
            throw new RuntimeException("Failed to start stress", e);
        }
    }
    public void startMemoryStress() {
    try {
        ProcessBuilder pb = new ProcessBuilder(
            "docker", "run", "--rm",
            "polinux/stress",
            "stress",
            "--vm", "1",
            "--vm-bytes", "512M",
            "--timeout", "60"
        );
        pb.inheritIO();
        pb.start();
    } catch (Exception e) {
        throw new RuntimeException("Failed to start memory stress", e);
    }
}

}
