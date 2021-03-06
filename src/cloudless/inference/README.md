# Cloud Detection

This is the inference portion of the cloudless pipeline once you have trained a
model to classify clouds.
There are two scripts:
  - `localization.py`: generates candidate regions in an image using [Selective
    Search](https://github.com/belltailjp/selective_search_py). This is
    decoupled from `predict.py` because this requires python3 and as of
    08/20/15 Caffe has limited support for python3
  - `predict.py`: standard inference script using Caffe's `classifier.py`
    class. Can take in a single image or a directory of images containing
    crops. This uses Python 2.7.

## Dependencies
- [Selective Search](https://github.com/belltailjp/selective_search_py)
- [Caffe](https://github.com/BVLC/caffe)

You will need to setup both python 2 and python 3 on the same system. Details on doing this for Mac OS X: http://joebergantine.com/blog/2015/apr/30/installing-python-2-and-python-3-alongside-each-ot/

## Steps
- Set env vars CAFFE_HOME and SELECTIVE_SEARCH
- Remove argmax layer from prototxt
```
./localization.py --input cat.jpg --directory regions #generates folder of regions
./predict.py --config alexnet.prototxt --weights alexnet.caffemodel --input regions/
```

## TODO
- Rank results by classification probability
