CityFlow
============

CityFlow is a multi-agent reinforcement learning environment for large scale city traffic scenario. 

Checkout these features!

- a microscopic traffic simulator which simulates the behavior of each vehicle, providing highest level detail of traffic evolution.
- support flexible definitions for road network and traffic flow
- provides friendly python interface for reinforcement learning
- **Fast!** Elaborately designed data structure and simulation algorithm with multithreading. Capable of simulating city-wide traffic. See the performance comparison with SUMO [#sumo]_.

.. figure:: https://user-images.githubusercontent.com/44251346/54403537-5ce16b00-470b-11e9-928d-76c8ba0ab463.png
    :align: center

    Performance comparison between CityFlow and SUMO. From small 1x1 grid roadnet to city-level 30x30 roadnet. Even faster when you need to interact with the simulator through python API.
    
Links
-----

- `Home Page <http://cityflow-project.github.io/>`_
- `Documentation and Quick Start <https://cityflow.readthedocs.io/en/latest/>`_
- `Docker <https://hub.docker.com/r/cityflowproject/cityflow>`_


.. [#sumo] `SUMO home page <https://sumo.dlr.de/index.html>`_
