forge b --skip test script --build-info

forge script script/deploy.local.s.sol:Local \
    --rpc-url https://opt-sepolia.g.alchemy.com/v2/5ogeTPhI1zKHgaKCzi5kZDJ5585EnMxS \
    --build-info \
    --broadcast \
    --verbosity

python deploy.py

