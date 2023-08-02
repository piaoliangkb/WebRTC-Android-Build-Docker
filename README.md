Before building and using this docker image to compile WebRTC source code for Android, it's better to setup proxy locally (e.g., by configuring ~/.docker/config.json).

Users are required to fetch Chromium depot tools and WebRTC source code first.
[A guide.](https://webrtc.googlesource.com/src/+/main/docs/native-code/android/)

Build docker image

```
bash build-docker-image.sh
```

Run docker image at current folder containing `depot_tools/` and `src/`

```
docker run -v $(pwd):/webrtc-android -it --rm centos8:webrtc bash
```

Compile WebRTC

```
tools_webrtc/android/build_aar.py --arch arm64-v8a --verbose
```
