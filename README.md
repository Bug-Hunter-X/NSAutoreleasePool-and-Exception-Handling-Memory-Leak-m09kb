# Objective-C NSAutoreleasePool and Exception Handling Memory Leak

This repository demonstrates a subtle memory leak bug in Objective-C that arises from the interaction between `NSAutoreleasePool` and exception handling.  If an exception is thrown within a block of code using an `NSAutoreleasePool`, the pool might not be drained properly, leading to memory leaks.

## Bug Description
The bug occurs when an exception interrupts the normal flow of execution before an `NSAutoreleasePool` can be drained. This leaves objects in the autorelease pool unreleased, resulting in a memory leak.

## How to Reproduce
1. Clone this repository.
2. Compile and run `ExceptionPoolBug.m`.
3. Observe the memory usage; a leak will manifest if the exception is triggered. 

## Solution
The provided `ExceptionPoolSolution.m` demonstrates a solution using a nested `@autoreleasepool` to ensure proper memory management even in the presence of exceptions.

## Additional Notes
This bug is subtle and can be difficult to diagnose without proper memory profiling tools.  Understanding the relationship between `NSAutoreleasePool`, exceptions, and memory management is crucial in avoiding this type of issue.