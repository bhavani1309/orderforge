package com.orderforge.controller;

import com.orderforge.service.StressService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/stress")
public class StressController {

    private final StressService stressService;

    public StressController(StressService stressService) {
        this.stressService = stressService;
    }

    @PostMapping("/cpu")
    public String stressCpu() {
        stressService.startCpuStress();
        return "CPU stress started";
    }

    @PostMapping("/memory")
    public String stressMemory() {
        stressService.startMemoryStress();
        return "Memory stress started";
}

}
