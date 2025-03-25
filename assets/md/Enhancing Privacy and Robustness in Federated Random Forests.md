# Enhancing Privacy and Robustness in Federated Random Forests


## Introduction

* Random forests (RF) are ensemble learning methods combining multiple decision trees, known for their robustness against overfitting and efficacy in classification and regression tasks.
* The conventional centralized training of RFs is ill-suited for the modern landscape of data that is often distributed, sensitive, and subject to privacy concerns.
* Federated learning (FL) enables the training of a global model through the iterative aggregation of updates from decentralized clients, ensuring data privacy.
* Traditional FL methods, mainly designed for parametric models like neural networks, are not directly applicable to non-differentiable tree-based models like RF.


## Random Forest Model

![](https://cdn.mathpix.com/cropped/2024_05_22_f32e270503a529e54071g-2.jpg?height=827&width=1264&top_left_y=1017&top_left_x=38)

Federated Learning Process

![](https://cdn.mathpix.com/cropped/2024_05_22_f32e270503a529e54071g-2.jpg?height=779&width=1412&top_left_y=1010&top_left_x=1295)

## Introduction
- Recent efforts to adapt RFs to FL environments involve clients independently training an equal proportion of the decision trees in the global ensemble.
* In this approach, termed Non-Collaborative Federated Forest (NCFF), each tree is limited to a client's local data, leading to potentially suboptimal splits and lower performance under nonIID distributions.
* We propose a federated random forest model where each tree is collaboratively grown across clients, allowing the ensemble to better reflect the data's heterogeneity across clients, enhancing performance on non-IID data.

![](https://cdn.mathpix.com/cropped/2024_05_22_f32e270503a529e54071g-3.jpg?height=1068&width=1634&top_left_y=796&top_left_x=465)


## Proposed Method - Tree Growing and Adjustment
- Tree Growing Phase: Clients iteratively receive and grow their assigned subset of the trees, using their local data. This ensures each tree is grown collaboratively using data from each client. Leaf nodes are left empty in this phase to minimize risk of client data leakage.
- Tree Adjustment Phase: The grown trees are redistributed to clients to update the leaf nodes with class probabilities. The server then aggregates these updates, averaging the class probabilities at each leaf node across all clients, ensuring each tree is sensitive to the data distribution of each client.

Client-Side Function \boldsymbol{g r o w}()
Input:
G : the subset of decision trees to be updated by the client
1. for each t in G
2. Randomly sample the client's training data with replacement to
   produce Z
3. Send mathbf{Z} from the root node of t down to the child nodes according to the partitioning condition of each node
4. At each leaf node of t, perform the following until the data at the node contains instances of only one class or a predefined tree depth is reached
5. quad Out of the N^{prime} features randomly selected from the total of N features in the dataset, select the feature and a split value that obtains the highest information gain to split on
6. Create two child nodes and send data down to them based on that split criterion


Client-Side Function adjust ()
Input:
E : the ensemble of decision trees grown collaboratively across all clients
1. for each t in E
2. Send the entire data on the client from the root node of t down to the child nodes according to the partitioning condition of the node
3. When a subset D of this data reaches a leaf node, perform the following:
4. Compute probability vector P=left[p_{1}, p_{2}, ldots, p_{C}\right], where p_{i} is the fraction of instances of class i over the total number of instances in D
5. Store P in the leaf node
6. return E

## Prediction
* Each test sample is passed through each tree in the global ensemble, reaching leaf nodes where class probabilities are stored.
- These probabilities are averaged across all trees and the class with the highest average probability is chosen as the final prediction.

Prediction example with 3 classes (1,2,3), 3 clients and 3 decision trees

![](https://cdn.mathpix.com/cropped/2024_05_22_f32e270503a529e54071g-6.jpg?height=1230&width=1472&top_left_y=632&top_left_x=518)

## Experimental Settings

* Evaluated on UCI datasets Pendigits and Letter Recognition, with an 80:20:20 train-test-split per class.
* Experiments were performed under simulated non-IID conditions through an alpha chunking strategy.
* The strategy divides each class into alpha chunks, shuffled and allocated to clients in round-robin.
- Maximum classes per client (M) calculated as M=leftlceil\frac{c cdot alpha}{k}\right\rceil
* Chose alpha values to limit M to a maximum of 3, ensuring non-IID conditions by restricting each client to a small, distinct subset of classes, increasing data diversity.

Key Experimental Parameters

| \boldsymbol{m} | \boldsymbol{k} | Split Criterion | Feature Sampling Strategy |
| :---: | :---: | :---: | :---: |
| 100 | 10 | Entropy | Square Root |

## Experimental Settings Per Dataset

| Data | Observations | Dimension | Classes | alpha | M |
| :---: | :---: | :---: | :---: | :---: | :---: |
| Pendigits | 10,992 | 16 | 10 | 2 | 2 |
| Letter Recognition | 20,000 | 16 | 26 | 1 | 3 |

## Experimental Results

- Proposed model significantly outperformed the NCFF model in all tested scenarios, demonstrating significant improvement over foundational federated learning approaches for random forests.
* This highlights its robustness to skewed or imbalanced data distributions across clients and its effectiveness in non-IID conditions.
* Achieved performance close to the centralized RF model, showing its capability to achieve competitive accuracies while operating in a decentralized and privacy-focused manner.
* Exhibited robust performance across all settings.


## Performance comparison

| Model / Dataset | Pendigits | Letter Rec. |
| :---: | :---: | :---: |
| Centralized RF | 0.991 | 0.963 |
| Non-Collab. Fed. Forest (NCFF) | 0.957 | 0.886 |
| Proposed model | 0.973 | 0.946 |
## Conclusions and Future Work

## Conclusions

* Innovative federated random forest approach optimized for non-IID data distributions.
* Proposed a novel collaborative ensemble construction method where each decision tree is grown iteratively across clients.
* Our collaborative tree growing and adjustment strategies allow the ensemble to capture the data heterogeneity in each client's dataset.
* Demonstrated robustness and superior performance in non-IID conditions, outperforming traditional federated random forest methods.


## Future Work

- Explore integration of differential privacy techniques to further strengthen privacy-preserving capabilities.
* Integrate a minimum sample threshold at the leaf nodes as a stopping criterion during tree growth to prevent information leakage.