.. _flow:

Flow File Format
===================

.. attention::
    The project is under active development, stable version of documentation and source code will be ready by mid May, stay tuned!
    
Flow file defines the traffic flow. Each flow contains following field:

- ``vehicle``: defines the parameter of vehicle.
    - length: length of the vehicle
    - width: width of the vehicle
    - maxPosAcc: maximum acceleration (in m/s)
    - maxNegAcc: maximum deceleration (in m/s)
    - usualPosAcc: usual acceleration (in m/s)
    - usualNegAcc: usual deceleration (in m/s)
    - minGap: minimum acceptable gap with leading vehicle (in meter)
    - maxSpeed: maximum cruising speed (in m/s)
    - headwayTime: desired headway time (in seconds) with leading vehicle, keep *current speed \* headwayTime* gap.
- ``route``: defines the route, all vehicles of this flow will follow the route.
- ``interval``: defines the interval of consecutive vehicles (in seconds). If the interval is too small, vehicles may not be able to enter the road due to blockage, it will be held and let go once there are enough space.
- ``startTime``, ``endTime``: Flow will generate vehicles between time [startTime, endTime] (in seconds), including ``startTime`` and ``endTime``.

Sample ``flowfile.json``

.. code-block:: json

  [
    {
      "vehicle": {
        "length": 5.0,
        "width": 2.0,
        "maxPosAcc": 2.0,
        "maxNegAcc": 4.5,
        "usualPosAcc": 2.0,
        "usualNegAcc": 4.5,
        "minGap": 2.5,
        "maxSpeed": 11.11,
        "headwayTime": 2.0
      },
      "route": [
        "road_1",
        "road_2",
        "road_3"
      ],
      "interval": 5,
      "startTime": 0,
      "endTime": 100
    }
  ]

