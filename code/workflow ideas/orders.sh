#!/bin/bash

# Starting executions. Results in results.txt
echo 'Results of wsclean orders' > results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 4 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 6 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 7 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 8 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.30000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.4 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.6000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.7000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 0.9 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.2000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.4000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.7000000000000002 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.8 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 1.9000000000000001 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.1 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.2 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.3000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.4000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.5 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.6 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.7 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.8000000000000003 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 2.9000000000000004 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3.0 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 4 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 6 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 10 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 12 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 14 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 1 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 2 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 3 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 1000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 2000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 5000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

echo 'Executing: singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms' >> results.txt
start_time=$(date +%s)
singularity exec --bind /mnt:/mnt /mnt/software/containers/wsclean_3.4_idg_dysco_everybeam.sif wsclean -niter 20000 -j 4 -auto-mask 5 -auto-threshold 3 -channels-out 8 -join-channels -scale 8asec -size 1280 1280 -fits-mask  -name images/img00 data/SNR_G55_10s.calib.ms
end_time=$(date +%s)
echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt
echo '---' >> results.txt

