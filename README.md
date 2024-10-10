# Smart-contract-based-public-integrity-auditing-for-cloud-storage-against-malicious-auditor
This repository stores the source code of the smart contract in paper "Smart contract-based public integrity auditing for cloud storage against malicious auditor". We construct two smart contracts, namely $SC_A$ and $SC_B$, to assist in the execution of the data auditing.

![The functions and structures of these two contracts](https://github.com/Gannan02/Smart-contract-based-public-integrity-auditing-for-cloud-storage-against-malicious-auditor/blob/main/smart%20contract.jpg)

## $SC_A$
The primary function of $SC_A$ is to produce sampled blocks and the corresponding random numbers in each auditing period. The content of contract $SC_A$ is negotiated by the CSP and DO, encompassing details such as the auditing frequency (daily, weekly, monthly, or on-demand) and how many blocks were sampled. Ultimately, the CSP generates and deploys the contract $SC_A$ to the blockchain. The address and its ABI will be published publicly. $SC_A$ will generate the sampled blocks' indexes and the random values using current blockchain information like block difficulty, timestamp, and other public data. The challenge values generated by $SC_A$ will be stored on the blockchain through the logging mechanism. The biggest advantage of using smart contracts, instead of relying on the TPA for generating challenge values, is the mitigation of collusion attack between the CSP and TPA. The immutability features of blockchain prevent biased sample blocks from being generated by the TPA.

## $SC_B$
The main function of $SC_B$ is to form the auditing log which contains the key metadata in the auditing process along with verification results and store it on the blockchain. The content of $SC_B$ is negotiated by the DO and TPA, and ultimately generated by TPA. Similar to $SC_A$, the contract address and its ABI are made public. Based on the traceability features of the blockchain, contract $SC_B$ ensures the transparency of the auditing process. Additionally, it solidifies auditing evidence due to the blockchain's immutability. This transparency and immutability allow anyone to independently verify the auditing results, serving as a form of supervision over the TPA's work.
