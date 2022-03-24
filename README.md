# ViewWillTransitionToSizeIssue
Demonstrates that the sizes reported in viewWillTransitionToSize are wrong in non full screen popovers.

## What's the Problem
A UIViewController subclass may implement (override) the `viewWillTransition(to:with:)` function. The documentation states:

    viewWillTransition(to:with:)
    Notifies the container that the size of its view is about to change.
    [...]
    size:
        The new size for the container’s view.

The problem is, that the size reported when this method gets called is consistently wrong whenever the view controller in
question is being presented in a `UIModalPresentationStyle` that doesn't result in the popover to cover the full screen.

## How to Reproduce / Observation
Check out the project in this repository. Build and run on any current iOS device or simulator (e.g. an iPad simulator).

The sample app will show a view controller displaying two pieces of information:

  1. the view controller's `view.bounds.size` as seen in `viewDidLayoutSubviews()`
  2. the size as it was reported in `viewWillTransition(to:with:)`

As long as the controller is not presented in a popover (initial view) the sizes always match (as expected). Note, that you
have to rotate the device once (or change into split view) so that `viewWillTransition(to:with:)` gets called.

If you press the navigation bar button labeled "PopOver", the same viewController is being presented as popover. Now note
that the sizes never match unless the popover covers the full screen (landscape on phones). Close the popover by swiping down.

## Conclusion
The size reported in `viewWillTransition(to:with:)` is wrong if the view controller in question is being presented and 
doesn't cover the full screen.

## Expectation
According to the documentation the size reported by `viewWillTransition(to:with:)` should match the actual size of the view
controller's view resizing finishes.
