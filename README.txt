This solution implments the enumerateObjectsUsingBlock: recursively. The Stack version calls a version in the nodes (Link class). This shows how one can imlpement the method. However the nodes do not know where they are in the list so need to pass an index.

The method componentsJoinedByString: is implemented using enumerateObjectsUsingBlock: so you can see how to call enumerateObjectsUsingBlock:.

Finally description is implemented using componentsJoinedByString:

Also reduced memory footprint by having clear and dealloc release elements instead of autorelease.