A more robust approach is to nest the `NSAutoreleasePool` within an `@autoreleasepool` block, or better yet, use `@autoreleasepool` directly and avoid manual pool management entirely: 

```objectivec
@try {
    @autoreleasepool {
        // ... some code that might throw an exception ...
    }
} @catch (NSException *exception) {
    // Exception handling code
}
```

This ensures the pool is always drained, regardless of whether an exception occurs.  Using `@autoreleasepool` is generally preferred for better memory management and reduced risk of leaks.  This avoids the manual `alloc` and `drain` calls and leverages the compiler’s optimization.