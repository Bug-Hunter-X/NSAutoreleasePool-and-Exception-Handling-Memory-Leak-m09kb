In Objective-C, a subtle bug can arise from the interaction between `NSAutoreleasePool` and exception handling. If an exception is thrown within a block of code protected by an `@try...@catch` statement, and that block also uses an `NSAutoreleasePool`, the pool might not be drained properly before the exception is handled. This can lead to memory leaks if objects are autoreleased within the `@try` block but the exception prevents the pool from being drained.  This is particularly problematic in lengthy operations where temporary objects are frequently autoreleased. 

Example:

```objectivec
@try {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    // ... some code that might throw an exception ...
    [pool drain];
} @catch (NSException *exception) {
    // Exception handling code
}
```

If an exception is thrown before `[pool drain]` is executed, the memory held by the `pool` won't be released. 