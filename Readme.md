**Tutorial for FEATURESELECT**

**Yosef Masoudi-Sobhanzadeha, Habib Motieghadera, Ali Masoudi-Nejada,\***

a Laboratory of system Biology and Bioinformatics, Institute of Biochemistry and
Biophysics, university of Tehran, Tehran, iran.

*FEATURESELECT*, an application for feature selection based on machine learning
methods, has been developed in laboratory of system biology and bioinformatics
(LBB). FEATURESELECT can be applied on problems needing to select subset of
features from given feature set. In continue, we describe some aspects of
*FEATURESELECT*.

**Implemented language**

MATLAB programing language is used for implementing of *FEATURESELECT*. There
are some reasons for using it:

1.  Because MATLAB is common programing language in different sciences,
    *FEATURESLECT* has been implemented in t. *FEATURESELECT* can be applied on
    various areas such as biological data, image processing, handwrite
    detection, computer science and many other fields.

2.  MATLAB is supported by various operating systems such as win, linux, mac.

3.  MATLAB is an open source programing language, so everyone can add some new
    capabilities on *FEATURESELECT*. After investigating new capabilities, we
    will publish new version of *FEATURESELECT* at
    https://github.com/yms3786/featureselect.git.

**Installation**

In order to install *FEATURESELECT*, you must provide some requirements:

1.  Install WINSDK.1 in windws or MinGW in linux that include C++ compiler

2.  Install MATLAB

After installing the requirements, follow these stages:

1.  Copy all files placed in *FEATURESELECT* folder on the one of the available
    directories.

2.  Go to \\FEATURESELECT\\matlab\\ in the intended directory.

3.  Click on the one of the matlab files which is available in the entered
    directory. Notice that the matlab path and the current directory path must
    be the same.

4.  If your application is not working for SVM, write "make" in the matlab's
    command window and press enter. Be sure that the command successfully
    completed. In order to get more information about LIBSM, look at
    https://www.csie.ntu.edu.tw/\~cjlin/libsvm/.

**Using from FEATURESELECT**

After installing the software, you can write "LBBFS" in the matlab command
window and use from *FEATURESELECT*. Consider fig.1 and fig.2.

![](media/2440008af808913464af5362a2587205.png)

Fig.1: run *FEATURESELECT*

![](media/3d641f7813c92d20cde31ed168939589.png)

Fig.2: *FEATURESELECT*

Fig.2 shows the *FEATURESELECT* software. This application has several sections:

1.  **LBB**: LBB is the ram of our laboratory. This laboratory has been founded
    by prof ali masoudi-nejad in 2006 at university of Tehran, iran.

2.  **Input**: Text, xls and matlab files are acceptable formats of input. You
    must convert xls file to txt file or m file if it has *struct* structure.
    TCN is abbreviation for training column number. Your data file and label
    file must be in the same file. Supposed file name is *input.tx* and the
    train column number (label of samples) is 222 in it. You can type your input
    file location in specified box or select it using *select input file
    button*. For some applications, we need to normalize or fuzzifize input
    file. *Data normalization* and *data fuzzification* are designed for this
    purpose. After clicking on the each of the mentioned buttons, a new file
    will be created and its name will be added to the specified box (data.txt).
    When you select an input file, rows of input file arrangement are changed
    randomly. If first row or first column is not part of input file, click *on
    first row is not data* or *first column is not data* respectively.
    *FEATURESELECT* has three main goals: 1- easy using from LIBSVM, ANN and DT,
    2- feature selection for regression problems and 3- feature selection for
    classification problems. The default option is regression. Disable “*this is
    regression problem”* option if your problem is classification.

3.  **Selecting learner type:** Three types of learners are available in
    *FEATURESELECT*. The first one is SVM. As mentioned before, intended SVM is
    based on parameters of LIBSVM. The second one is ANN which only includes one
    parameter (training iteration). We examined some types of artificial neural
    networks. Finally, the results showed that optimization algorithms can lead
    to better results in training phase of ANN. Meanwhile, the elapsed time of
    training phase is enhancing, so it is advised that this type of learner is
    applied on small datasets. Also, you can select your features by the SVM or
    DT, and then use ANN in order to obtain an efficient model. The third
    learner is decision tree (DT). This learner does not need parameter setting.

4.  **Selecting parameters of LIBSVM:** If your learner type is SVM, you can set
    parameters in this section. Learning parameter which can be selected by the
    doted button (fig.3) includes LIBSVM's parameters. Training data percentage
    and maximum number of features which is desirable for your application can
    be written in the related boxes. Also, if you want to apply LIBSVM on the
    all of the features (in other words, if you don’t want feature selection),
    click on the *only apply SVM* button**.**

    ![](media/c7ee1673e9a65c723a4b1fbc8b792974.png)

    Fig.3: learning parameters of LIBSVM

5.  **Feature selection method:** Two types of feature selection methods are
    available in *FEATURESELECT*: 1- Wrapper method (optimization algorithm). 2-
    Filter method: this type of feature selection consists of five popular
    methods. The experimental results show that every learner and every method
    have their special view relative to dataset, but wrapper methods can lead to
    better results than filter methods in overall state.

6.  **Algorithms**: Eleven algorithms have been developed for selecting features
    from feature set in wrapper method section. It is advised that the
    optimization algorithms iterated more than 30 times because of stochastic
    nature of them. You can set number of iterations in the relative box. The
    new from such as fig.4 which is result of clicking on WCC algorithm will
    appear. Then you can set the algorithm parameters.

    ![](media/de6ca02bda8354c1a1f1d4b6fdee8170.png)

    Fig.4: WCC's parameters

    The developed algorithms and their reference are:

7.  WCC (world competitive contest): this algorithm is inspired by human sport
    rules. The default values are determined fairly and based on number of
    LIBSVM calling for all of the algorithms. You can get more information about
    WCC in <http://www.sciencedirect.com/science/article/pii/S2352914816300077>.

8.  LCA (league championship algorithm): LCA is an algorithm inspired by sport
    championships. Here is a link for download LCA original paper:
    <http://www.sciencedirect.com/science/article/pii/S1568494613004250>.

9.  GA (genetic algorithm): GA is the first optimization that mimics natural
    evolutionary processes. *Crate* and *mrate* are abbreviation for crossover
    rate and mutation rate in FEATURESELECT. More information about genetic
    algorithms is available in
    <http://www.sciencedirect.com/science/article/pii/S0377042705000774>.

10. PSO (particle swarm optimization): PSO inspired by social behavior of birds.
    Unlike GA, PSO has not evolutionary operations such as crossover and
    mutation. Groups of birds fly toward destination. Useful information about
    PSO is available in <http://www.swarmintelligence.org/tutorials.php>.

11. ACO (ant colony optimization): this algorithm proposed by marco dorigo in
    1992 inspired by ants social behavior. Some aspects of ACO can be found in
    <http://www.sciencedirect.com/science/article/pii/S0167739X0000042X>.

12. ICA (imperialist competitive algorithm): atashpaz gargari proposed ICA which
    is an algorithm inspired by imperialistic competition. You can download
    relative paper from <http://ieeexplore.ieee.org/document/4425083/>.

13. LA (learning automata): an automata is an abstract concept. Every cellular
    automata selects an action from action set and applies it on environment.
    The selected action will be awarded or penalized. Meybodi published
    application of LA in
    <https://link.springer.com/chapter/10.1007/3-211-27389-1_35>.

14. HTS (heat transfer optimization algorithm): it is a meta-heuristic algorithm
    which is recently introduced and is based on thermodynamics law. HTS is
    available in
    <http://www.sciencedirect.com/science/article/pii/S0020025515004764>. We
    showed conduction factor as CDF, convection factor as COF and radiation
    factor as ROF in FEATURESELECT.

15. FOA (forest optimization algorithm): FOA has been proposed by manizheh
    ghaemi and has interesting results. This algorithms begins with some
    randomly created trees as potential solutions. Original research article can
    be accessed in
    <http://www.sciencedirect.com/science/article/pii/S0031320316300954>.

16. DSOS (discrete symbiotic organisms search): DSOS has been published in 2017.
    It has been showed that DSOS is comparable with the other optimization
    algorithms, so we implemented it in FEATURESELECT. Original paper of DSOS
    can be found in
    <http://www.sciencedirect.com/science/article/pii/S0957417417304141>.

17. CUK (cuckoo optimization): CUK is proper for continuous nonlinear
    optimization problem. CUK is inspired by the life of bird family.
    <http://www.sciencedirect.com/science/article/pii/S1568494611001670>.

18. **Notifications**

>   After running the selected algorithms, the status of program is showed in
>   the notification section.

>   **Outputs**

>   The *results* folder is placed in the directory which contains
>   *FEATURESELECT's* files. For the regression problem, 2 files named
>   *description* and *tbls* are created. For the classification problems, 3
>   files named *description*, *evaluation* and *tbls* are created. Date and
>   time are added to the end of created file name. The created files contents
>   also are presented in the matlab command window. *Description* file (for
>   both regression and classification problems) includes some information such
>   as number of features and their indices, etc. *Evaluation* file that is
>   specific for classification problems includes statistical measures which are
>   essential for classification problems. For both classification and
>   regression problems, *Tbls* file includes some other statistical information
>   such as p-value, confidence interval, standard deviation, etc. Fig.5 through
>   fig.7 are output instances which have been acquired by batch running of the
>   all algorithms on supposed input file located in *FEATURESELECT* directory.

![F:\\LBB\\feature selection\\matlab\\help\\o1_regression.tif](media/22a41fb605399eb7de659df11e126e77.tiff)

>   Fig.5: part of *description* file

![F:\\LBB\\feature selection\\matlab\\help\\o2_regression.tif](media/4bf7aebb438f140d04a94cc58f0fecf3.tiff)

>   Fig.6: part of *tbls* file

![](media/68d4b516b4e6b9c2e9f711de937897e9.tiff)

>   F:\\LBB\\feature selection\\matlab\\help\\evaluation.tif

>   Fig.7: part of *evaluation* file (only for classification)

>   Table.1 shows abbreviation used in *FEATURESELECT* and their complete
>   states.

>   Table.1: abbreviations

| abbreviation | Complete state            |
|--------------|---------------------------|
| ACC          | Accuracy                  |
| SEN          | Sensitivity               |
| SPC          | Specificity               |
| FPR          | False positive rate       |
| AL_NAME      | Algorithm name            |
| PRE          | Precision                 |
| NOP          | Number of features        |
| ET           | Elapsed time              |
| ER           | Error                     |
| CR           | Correlation               |
| STD          | Standard deviation        |
| CI           | Confidence interval       |
| P            | p-value                   |
| DF           | Degree of freedom         |
| ANN          | Artificial neural network |
| DT           | Decision tree             |

>   Accuracy convergence, accuracy average convergence (accuracy for all of the
>   population in specific generation), accuracy stability, error convergence,
>   error average convergence (for all potential solutions in specific
>   generation) and error stability are plotted for classification problems
>   (fig.8). Error convergence, error average convergence, error stability,
>   correlation convergence, correlation average convergence and correlation
>   stability are plotted for regression problem (dig.9). ROC plot, a
>   statistical measurement that investigates diagnostic ability of classifier,
>   and ROC space are showed in fig.10. You can modify these plots using
>   *view/property editor* menu.

![](media/ecde077452f1488148cb67fa14a2bb94.tiff)

>   F:\\LBB\\feature selection\\matlab\\help\\classification.tif

>   Fig.8: algorithms output for classification problem

![](media/2130b65b6db5a7d02cd5405e1f1cbe02.tiff)

>   F:\\LBB\\feature selection\\matlab\\help\\regression.tif

>   Fig.9: algorithms output for regression problem

![](media/58e8c9d0d9c78a46a59001f8e49e1f50.tiff)

>   F:\\LBB\\feature selection\\matlab\\help\\ROC.tif

>   Fig.10: ROC plot and ROC space
