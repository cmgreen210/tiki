require 'unsup'
require 'image'
require 'optim'

cmd = torch.CmdLine()
cmd:text()
cmd:text('Train an autoencoder on faces data set')
cmd:text()
cmd:text('Options')

cmd:option('-dir', 'outputs', 'subdirectory to save experiments in')
cmd:option('-seed', 1, 'initial random seed')
cmd:option('-threads', 2, 'threads')

cmd:option('-inputsize', 86, 'size of each input patch')
cmd:option('-nfiltersin', 1, 'number of input convolutional filters')
cmd:option('-nfiltersout', 16, 'number of output convolutional filters')
cmd:option('-lambda', 1, 'sparsity coefficient')
cmd:option('-beta', 1, 'prediction error coefficient')
cmd:option('-eta', 2e-3, 'learning rate')
cmd:option('-batchsize', 1, 'batch size')
cmd:option('-etadecay', 1e-5, 'learning rate decay')
cmd:option('-momentum', 0, 'gradient momentum')
cmd:option('-maxiter', 1000000, 'max number of updates')

-- convolutional kernel
cmd:option('-kernelsize', 9, 'size of convolutional kernels')

-- logging:
cmd:option('-statinterval', 5000, 'interval for saving stats and models')
cmd:option('-v', false, 'be verbose')
cmd:option('-display', true, 'display stuff')
cmd:option('-wcar', '', 'additional flag to differentiate this run')
cmd:text()

params = cmd:parse(arg or {})

rundir = cmd:string('ae', params, {dir=true})
params.rundir = params.dir .. '/' .. rundir

if paths.dirp(params.rundir) then
    os.execute('rm -r ' .. params.rundir)
end
os.execute('mkdir -p ' .. params.rundir)
cmd:addTime('ae')
cmd:log(params.rundir .. '/log.txt', params)

torch.manualSeed(params.seed)

torch.setnumthreads(params.threads)
