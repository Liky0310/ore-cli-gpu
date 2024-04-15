#!/bin/bash
i=${1}
if (($i >= 0 && $i < 10)); then
    prefix="a"
elif (($i >= 10 && $i < 20)); then
    prefix="b"
elif (($i >= 20 && $i < 30)); then
    prefix="c"
else
    prefix="d"
fi
tmux kill-session -t $prefix$i
tmux new-session -d -s "$prefix$i" bash -c '
    RPC_LIST=(
        "https://purple-orbital-county.solana-mainnet.quiknode.pro/d45f3d8e007f82f878396f1aa81b157b51fdbbde/"
        "https://neat-dawn-lake.solana-mainnet.quiknode.pro/dbcef51012fdcd33fd3b7dcdfe28ef8f954fc301/"
        "https://ancient-clean-knowledge.solana-mainnet.quiknode.pro/ee62d7edb9da38585636a919f34180d4f37d5617/"
        "https://aged-solemn-diagram.solana-mainnet.quiknode.pro/e7ca8ce4f0d858d89f8fc4989088a676536ed271/"
        "https://young-polished-wish.solana-mainnet.quiknode.pro/33df00a55fd629258126b68a66083e54de983ca8/"
        "https://methodical-fittest-leaf.solana-mainnet.quiknode.pro/4b20fbfefba390073b34b9c74f4936f35952baa5/"
        "https://blissful-young-card.solana-mainnet.quiknode.pro/683be7fd77e20b7d8281ead57cc2d3aaaad896cf/"
        "https://distinguished-wiser-theorem.solana-mainnet.quiknode.pro/03e8f5a285ba24985776d35ee83fe1ff4b9e6650/"
        "https://methodical-holy-moon.solana-mainnet.quiknode.pro/5a8d244880967442fb66bceed751e95cfaa79732/"
        "https://summer-quaint-wildflower.solana-mainnet.quiknode.pro/07ff98d65a67556379fd7a47a49578074f2352d2/"
        "https://attentive-late-uranium.solana-mainnet.quiknode.pro/46fcd0f242e128a897396ae9cd0738e2db2d2f5a/"
    );
    while true; do
        RPC=${RPC_LIST[$RANDOM%${#RPC_LIST[@]}]}
        set -x
	ore --rpc "$RPC" --keypair ./id'$i'.json --priority-fee 1 mine --threads 4
        set +x
	if [ $? -ne 0 ]; then
            echo "进程异常退出,等待重启" >&2
            sleep 1
        fi
    done
'

