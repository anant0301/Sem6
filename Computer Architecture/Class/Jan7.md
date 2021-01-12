## The architecture today ##

- The Frequency can't go beyond 3.6 Ghz or 4 Ghz
- The silicon would not be able to dissipate heat if the speed get's faster
- There are some Ga/As based chips but the cost is also high in these cases

### Computer Classes ###
Based on the emphasis the architecture changes, the types of computer classes considered are :
- Personal Mobile Devices
    - Emphasis on Energy efficiency and real-time
- Desktop Programming 
    - Emphasis on Price-Performance.. higher the price better the performance
- Servers
    - Emphasis on Scalability, Availabiltiy and Throughput
- Clusters/ Super Computers
    - Emphasis on Availability, price-performance, floating point operations and internal networks
- Embedded Computer
    - Price and purpose

### Parallelism ###
- Data Level Parallelism
- Task Level Parallelism
- Architecture Level Parallelism 
    - Instruction Level Parallelism
    - Vector Architecture
    - Thread Level Parallelism
    - Request Level Parallelism

### Flynn's Taxonomy ###
1. Single Instruction Single Data Stream **SISD**- This approach worked for signle core architecture and it was exhausted around the 2003, 
1. Single Instruction Multiple Data Stream **SIMD**- This was the approach for multi-core architecture:
    - Vector Architecture
    - GPUs
    - Multimedia Extent
1. Multiple Instruction Single Data Stream **MISD**- Not used in commercial use until now.
1. Multiple Instruction Multiple Data Stream **MIMD**- Types are
    - Tightly-Coupled MIMD
    - Loosely-Coupled MIMD


[contd](./Jan11.md)