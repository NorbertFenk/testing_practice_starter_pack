# tdd_practice_starter_pack
This is a simple skeleton to try out TDD with C++, Qt, and GTest.


# How to use

## Check docker and docker-compose

If you not installed yet please use these guides:
  * https://docs.docker.com/engine/installation/
  * https://docs.docker.com/compose/install/

## Docker and docker-compose is ok

Use
```
docker-compose up
```
at the Docker folder of the project or use the command anywhere but specify the **docker-compose.yml** location with **-f** switch. If you use the **-d** switch you can reuse the terminal.
This command will download a docker image from docker hub and start a container. You can check the **Dockerfile** (image descriptor) and the **docker-compose.yml** under the Docker folder. This step may take a while. (I will try to optimize this later)

## Build the project

When you see message like this **Attaching to docker_tdd-docker_1** on the console output, you can use your running container to build your project.

This command will give you a tty session to your running container.
```
docker-compose exec tdd-docker bash
```
After this command your terminal attached to your container. The working directory is set to **/source**. You can change it in the Dockerfile under the Docker folder.

#### NOTE: If you want to exit from the session use the **exit** command.
#### NOTE: If you finish your work with the container you sould stop the compose session. **Ctrl + c** will stop the output of the console but the resources (e.g.: container(s), network, etc) still running at the background. 
You should always use
```
docker-compose down
```
to switch off your work setup.

### Build steps
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Coverage ..
make
```
Under **build/src** you can find your binary.
Under **build/test** you can find your test binary.
The **-DCMAKE_BUILD_TYPE=Coverage** switch is optionally but necessary for code coverage.

### Show me the coverage
```
cd build/test
./example_test
cd ..
make coverage
```
Under **build/coverage** you will find index.html you can open it e.g. with a browser.
If you want to reset the coverage stats. Use this command 
```
make zero_coverage
```

### Static analyzer
```
cppcheck --quiet --error-exitcode=1 .
```

# Resources 
* https://crascit.com/2015/07/25/cmake-gtest/
* https://github.com/Crascit/DownloadProject
* http://david-grs.github.io/cpp-clang-travis-cmake-gtest-coveralls-appveyor/
* https://github.com/david-grs/clang_travis_cmake_gtest_coveralls_example
* https://arne-mertz.de/2017/04/continuous-integration-travis-ci/
* https://github.com/richelbilderbeek/travis_cpp_tutorial
* https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake
* https://codeflu.blog/2014/12/26/using-gcov-and-lcov-to-generate-beautiful-c-code-coverage-statistics/
* http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/

