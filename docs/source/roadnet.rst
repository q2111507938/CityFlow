.. _roadnet:

Roadnet File Format
===================

.. attention::
    The project is under active development, stable version of documentation and source code will be ready by mid May, stay tuned!

Roadnet file defines the roadnet structure. CityFlow's roadnet mainly consists of intersections and roads (see them as nodes and edges of a graph). 

- *Road* represents a directional road from one *intersection* to another *intersection* with road-specific properties. A *road* may contain multiple *lanes*. 
- *Intersection* is where roads intersects. An *intersection* contains several *roadlinks*. Each *roadlink* connects two roads of the intersection and can be controlled by traffic signals. 
- A *roadlink* may contain several *lanelinks*. Each lanelink represents a specific path from one lane of incoming road to one lane of outgoing road. 

Now let's see a sample roadnet file and we'll explain the meaning of each components. Relax, the definition of field is quite straight forward, if you are familiar with modern road networks. For the following json file, ``[]`` means this field is an array, but we will only show one object for demonstration. A full sample can be found at ``todo``.

Sample ``roadnet.json``

.. code-block:: js

  {
    "intersections": [
      {
        // id of the intersection
        "id": "intersection_1_0",
        // coordinate of center of intersection
        "point": { 
          "x": 0,
          "y": 0
        },
        // width of the intersection
        "width": 10,
        // roads connected to the intersection
        "roads": [
          "road_1",
          "road_2"
        ],
        // roadLinks of the intersection
        "roadLinks": [
          {
            // 'turn_left', 'turn_right', 'go_straight'
            "type": "go_straight",
            // id of starting road
            "startRoad": "road_1",
            // id of ending road
            "endRoad": "road_2",
            // lanelinks of roadlink
            "laneLinks": [ 
              {
                // from startRoad's startLaneIndex lane to endRoad's endLaneIndex lane
                "startLaneIndex": 0, 
                "endLaneIndex": 1,
                // points along the laneLink which describe the shape of laneLink
                "points": [
                  {
                    "x": -10,
                    "y": 2
                  },
                  {
                    "x": 10,
                    "y": -2
                  }
                ]
              }
            ]
          }
        ],
        // traffic light plan of the intersection
        "trafficLight": {
          "lightphases": [
            {
              // default duration of the phase
              "time": 30,
              // available roadLinks of current phase, index is the no. of roadlinks defined above.
              "availableRoadLinks": [
                0,
                2
              ]
            }
          ]
        },
        // true if it's a peripheral intersection (if it only connects to one road)
        "virtual": false
      }
    ],
    "roads": [
      {
        // id of road
        "id": "road_1",
        // id of start intersection
        "startIntersection": "intersection_1",
        // id of end intersection
        "endIntersection": "intersection_2",
        // points along the road which describe the shape of the road
        "points": [
          {
            "x": -200,
            "y": 0
          },
          {
            "x": 0,
            "y": 0
          }
        ],
        // property of each lane
        "lanes": [
          {
            "width": 4,
            "maxSpeed": 16.67
          }
        ]
      }
    ]
  }


.. figure:: _static/roadnet.jpg
    :align: center

    Illustration of a 1x2 grid roadnet.