#include "flow/flow.h"
#include "engine/engine.h"
#include "roadnet/roadnet.h"


namespace CityFlow {
	void Flow::nextStep(double timeInterval) {
        if (endTime != -1 && currentTime > endTime) return;
        if (currentTime >= startTime) {
            while (nowTime >= interval) {
                Vehicle* vehicle = new Vehicle(vehicleTemplate, id + "_" + std::to_string(cnt++), engine);
                int priority = vehicle->getPriority();
                while (engine->checkPriority(priority)) priority = engine->rnd();
                vehicle->setPriority(priority);
                engine->pushVehicle(vehicle);
                nowTime -= interval;
            }
            nowTime += timeInterval;
        }
		currentTime += timeInterval;
	}

	std::string Flow::getId() const {
		return id;
	}

	void Flow::reset() {
		nowTime = interval;
		currentTime = 0;
		cnt = 0;
	}
}