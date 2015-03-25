# ===
# Deep Learning dev tools
# ===
# curl http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-MacOSX-x86_64.sh
# bash Anaconda-2.1.0-MacOSX-x86_64.sh
rm Anaconda-2.1.0-MacOSX-x86_64.sh
source ~/anaconda/bin/activate ~/anaconda

pip uninstall theano
mkdir ~/python
git clone https://github.com/Theano/Theano.git ~/python/Theano
git clone https://github.com/bartvm/blocks.git ~/python/blocks
git clone https://github.com/bartvm/fuel.git ~/python/fuel
git clone https://github.com/dwf/picklable_itertools.git ~/picklable_itertools.git
git clone https://github.com/lisa-lab/pylearn2.git ~/pylearn2

for d in Theano picklable_itertools blocks fuel pylearn2 ; do
    python ~/$d/setup.py develop
done
