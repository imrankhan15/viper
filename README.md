# viper

here we have implemented the VIPER(view, Interactor, presenter, Entity, Router framework).

In this project we download some data from a web host and show it in a table view.

The workflow of VIPER pattern works here as follows:

1. Atfirst the router is being called in the SceneDelegate.swift method.
2. Then in the router.swift, the presenter is called.
3. Then the presenter calls the Interactor to download the data.
4. The interactor downloads the data as Entity and then it is given to the View.

**I made this app with the help of this tutorial https://www.youtube.com/watch?v=hFLdbWEE3_Y


