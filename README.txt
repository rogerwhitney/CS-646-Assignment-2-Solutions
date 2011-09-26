This is solution is the simplest. It is sort of cheating as the hard work of enumerateObjectsUsingBlock: and componentsJoinedByString: are done by adding all the elements in the stack into an array and using the array to perform those operations. There are other problems with this solution. The dealloc method only autoreleases the elements in stack. While this does work it give the code using the stack a bigger memory footprint that needed. 

Things to notice:

    How and when objects are retained and released. There are other ways of doing it, but having teh Stack maintain ownership of the nodes (Link) in the list and the elements added to the stack seemed the simplest.

    The recursive nature of description. The Stack description method calls the Link description method.