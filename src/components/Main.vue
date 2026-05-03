<template>

  <head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <div class="main">
    <div class="section header">
      <div class="title"><img class="mat-icon" src="/icon2.png">MemoryEQA</div>
      <div class="subtitle">
        <span class="uns">Memory</span>-Centric <span class="uns">E</span>mbodied <span class="uns">Q</span>uestion <span class="uns">A</span>nswer
      </div>

      <div class="author-list">
        <span class="author">
          <el-link href="https://zmling22.github.io/">Mingliang Zhai</el-link>
          <span class="ind">1,2 &#9733;</span>,
        </span>
        <span class="author">
          <el-link href="https://zhigao2017.github.io/">Zhi Gao</el-link>
          <span class="ind">1,2 &#9733;</span>
        </span>
        <span class="author">
          <el-link href="https://wu-yuwei-bit.github.io/">Yuwei Wu</el-link>
          <span class="ind">&#9993;3,4</span>,
        </span>
        <span class="author">
          <el-link href="https://scholar.google.com/citations?user=Sl6TV7gAAAAJ&hl=en">Yunde Jia</el-link>
          <span class="ind">4,3</span>,
        </span>
        <br>
      </div>
      <div class="author-list">
        <span class="org">
          <span class="ind">1</span>
          Beijing Institute of Technology
        </span>
        <br>
        <span class="org">
          <span class="ind">2</span>
          Shenzhen MSU-BIT University
        </span>
      </div>

      <span class="link-block">
        <a href="https://arxiv.org/pdf/2505.13948" class="external-link button is-normal is-rounded is-dark">
          <span class="icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="1.0em" height="1.0em" viewBox="0 0 24 24">
              <path fill="currentColor"
                d="M3.842 0a1 1 0 0 0-.922.608c-.153.369-.044.627.294 1.111l6.919 8.36l-1.023 1.106a1.04 1.04 0 0 0 .003 1.423l1.23 1.313l-5.44 6.444c-.28.3-.453.823-.297 1.199a1.025 1.025 0 0 0 .959.635a.91.91 0 0 0 .689-.34l5.783-6.126l7.49 8.005a.85.85 0 0 0 .684.26a.96.96 0 0 0 .877-.615c.158-.377-.017-.75-.306-1.14L13.73 13.9l1.064-1.13a.963.963 0 0 0 .009-1.316L4.633.464S4.26.01 3.867 0zm0 .272h.017c.218.005.487.272.564.364l.005.006l.005.005l10.17 10.99a.69.69 0 0 1-.008.946l-1.066 1.133l-1.498-1.772l-8.6-10.39c-.328-.472-.352-.619-.26-.841a.73.73 0 0 1 .671-.44Zm14.341 1.57a.88.88 0 0 0-.655.242l-5.696 6.158l1.694 1.832l5.309-6.514c.325-.433.479-.66.325-1.029a1.12 1.12 0 0 0-.977-.689m-7.655 12.282l1.318 1.414l-5.786 6.13a.65.65 0 0 1-.496.26a.75.75 0 0 1-.706-.467c-.112-.269.036-.687.244-.909l.005-.005l.005-.006z" />
            </svg>
          </span>
          <span>arXiv</span>
        </a>
      </span>
      <span class="link-block">
        <a href="https://github.com/memory-eqa/MemoryEQA" class="external-link button is-normal is-rounded is-dark">
          <span class="icon">
            <i class="fab fa-github"></i>
          </span>
          <span>Code</span>
        </a>
      </span>

      <!-- Data Link. need changing -->
      <span class="link-block">

        <a target="_blank" href="https://huggingface.co/datasets/zmling/MT-HM3D"
          class="external-link button is-normal is-rounded is-dark">
          <span class="icon">
            <i class="fa fa-database"></i>
          </span>
          <span>Data</span>
        </a>
      </span>

      <!-- <span class="link-block">
        <a href="file/clova_cvpr24_poster.pdf"
            class="external-link button is-normal is-rounded is-dark">
          <span class="icon">
            <i class="fas fa-file-pdf"></i>
          </span>
          <span>Submited to NeurIPS 2025</span>
        </a>
      </span> -->

      <!-- <span class="link-block">
            <a href="file/clova_slides.pdf"
               class="external-link button is-normal is-rounded is-dark">
              <span class="icon">
                  <i class="fas fa-file-pdf"></i>
              </span>
              <span>Slides</span>
            </a>
          </span> -->

    </div>

    <div class="tldr">
      <p><b>TL;DR</b> 
        The paper proposes MemoryEQA, a memory-centric embodied question answering (EQA) framework with the MT-HM3D dataset for evaluate memory ability of EQA models, 
        boosting performance by 3.4% on MT-HM3D from prior sota model.</p>
    </div>

    <div class="section">
      <el-card class="teaser">
        <el-image src="./teaser.png"></el-image>
      </el-card>
    </div>


    <div class="section">
      <div class="section-title">Introduction</div>
      <p class="intro">
        Embodied Question Answering (EQA) requires agents to explore environments and reason over observations to answer questions. 
        However, suboptimal exploration and inaccurate answers remain challenging in complex EQA tasks involving multiple regions and targets.
        These problems stem from ineffective memory construction and indiscriminate memory retrieval, leading to failures across modules.
        The planner lacks global context to guide exploration, the stopping module cannot reliably determine whether sufficient evidence has been collected, and the answering module receives incomplete or irrelevant information.
        In this paper, we propose a memory-centric EQA method that treats memory as a central component for both exploration and reasoning. 
        Our method continuously updates memory during exploration and retrieves module-specific information for planning, stopping, and answering.
        We first construct a multi-modal structured memory that accumulates both scene-level and object-level evidence. 
        To maintain memory quality, we introduce a viewpoint comparison strategy that filters redundant and noisy observations. 
        Furthermore, we develop an entropy-based adaptive retrieval mechanism that dynamically controls the scope of retrieved memory for each module, ensuring efficient and non-redundant reasoning.
        To evaluate our approach in scenarios that demand memory capabilities, we introduce a new EQA benchmark, MT-HM3D, which focuses on multi-target and multi-region reasoning.
        Experiments on MT-HM3D, HM-EQA, and OpenEQA demonstrate that our method effectively improves exploration efficiency and answer accuracy.
      </p>
    </div>

    <div class="section">
      <div class="section-title">Method</div>
        <div class="intro">
          Given the input question and agent observation, we first update the hierarchical memory. 
          Subsequently, question-relevant memories are retrieved through the memory retriever and injected into the respective modules.
          We concatenate the memories and the question, which are then fed into the planner to determine the next navigation point. 
          Once the agent arrives at a navigation point, it assesses whether to halt its journey. If the decision is `No', the process loops back to 
          the memory update step; if `Yes', the agent responds to the question.
        </div>
      <br>
      <el-card class="teaser">
        <el-image src="./framework.png"></el-image>
      </el-card>
    </div>



    <div class="section">
      <div class="section-title">Dataset Construction</div>
      <p class="intro"> 
        To evaluate memory ability of the models, we propose an multi-target EQA dataset based on HM3D. 
        We first sample 5 to 10 images from the scene using the Habitat simulator. And then we input the sampled images and prompt the GPT-4o select multiple related 
        objects from those images, specifying the output format to obtain raw data.
        For filter the raw data, we use GPT-4-mini to removing illogical question-answer pairs, and generate diverse QA data.
        Finally, we manually verify the correctness of the data to ensure that the questions can be answered within the embodied environment.
        Through the above steps, we constructed 1587 QA pairs of 4 types, and the statistical information is shown in figure.
      </p>

      <el-card class="teaser">
        <el-image src="./stats/data.jpg"></el-image>
      </el-card>

    </div>

    <div class="section">
      <div class="section-title">Evaluation and Results </div>
      <div class="intro">
        We evaluate the <b>MemoryEQA</b> on three dataset: <b>MT-HM3D</b>, <b>GAIA</b> and <b>OpenEQA</b>. 
        The results show that the MemoryEQA achieves improvements on all datasets, which
        outperforms baseline by 19.8% on MT-HM3D, showing the effectiveness of the proposed framework, leading to obtain
        better memory capabilities.
        <br>
      </div>

      <div class="intro">
        <b>Metric.</b> 
        In the <b>MT-HM3D</b> and <b>HM-EQA</b> dataset, we measure two metrics for agents, including
        <i><b>Succ.</b></i> measures the correctness of predicted answers. 
        <i><b>Success weighted by path length (SPL)</b></i> to evaluate the efficiency of the agents.
        <i><b>LLM-Match</b></i> measures the similirity between predicted open-vocabulary answers and ground-truth answers.
        <i><b>Length</b></i> measures the length of exploration path between predicted open-vocabulary answers and ground-truth answers.
        <br>
      </div>

      <div class="intro">
        <b>Results.</b> 
        To comprehensively evaluate MemoryEQA, we adopt the active EQA setting. We first assess memory capability on the multi-target dataset MT-HM3D, and then evaluate performance on general tasks using the widely used HM-EQA and OpenEQA benchmark.
        MemoryEQA achieves the largest performance gains on MT-HM3D, highlighting the importance of explicit memory management and module-specific retrieval in complex, memory-intensive scenarios.
        It also improves efficiency across benchmarks by reducing redundant exploration and enabling more direct access to task-relevant evidence.
        Furthermore, MemoryEQA delivers strong category-wise performance, particularly on tasks requiring multi-target reasoning and cross-region evidence aggregation.
        <br>
      </div>
      <el-card class="stats-img-1">
        <el-image src="./results/result1.png"></el-image>
      </el-card>
      <el-card class="stats-img-1">
        <el-image src="./results/result2.png"></el-image>
      </el-card>
      
      
    </div>

  </div>

  <section class="section" id="BibTeX" style="text-align: left;">
    <div class="container is-max-desktop content" style="max-width: 100%; margin: 0 auto;">
      <h3 class="title" style="font-size: small;">
        BibTeX
      </h3>
      <div class="bibtex-container">
        <pre><code class="language-bibtex">
    @inproceedings{gao2025multi,
      title={Memory-Centric Embodied Question Answering},
      author={Zhai, Mingliang and Gao, Zhi and Wu, Yuwei and Jia, Yunde},
      booktitle={arXiv preprint arXiv:2505.13948}
    }
</code></pre>
      </div>
    </div>
  </section>


  <div class="footer">
    This website is inspired by <el-link href="https://mathvista.github.io/">MathVista</el-link> and <el-link
      href="https://nerfies.github.io/">Nerfies</el-link>.
  </div>
</template>

<script setup>
import Dialog from './Dialog.vue'

import { onMounted, ref } from 'vue'

const dataset1 = ref([])
const loadData1 = async () => {
  const resp1 = await fetch('./data/demo-100k.json')
  dataset1.value = await resp1.json()
}

const dataset2 = ref([])
const loadData2 = async () => {
  const resp2 = await fetch('./data/demo-1m.json')
  dataset2.value = await resp2.json()
}

const dataset3 = ref([])
const loadData3 = async () => {
  const resp3 = await fetch('./data/demo-bench.json')
  dataset3.value = await resp3.json()
}

onMounted(() => {
  loadData1(),
    loadData2(),
    loadData3()
})
</script>






<style scoped>
.main {
  text-align: center;
  color: #333;
}

.header {
  margin: 60px 0 0 0 !important;
}

.title {
  font-size: 5em;
}

.subtitle {
  font-size: 2.5em;
  color: #555;
}

.author-list {
  margin-top: 20px;
}

.author a {
  font-size: 1.2em;
  font-weight: normal;
  color: #337ecc;
}

.org {
  margin: 0 4px 0 4px;
}

.ind {
  font-size: 0.8em;
  vertical-align: super;
}

.section {
  margin: 50px 0;
}

.tldr {
  text-align: left;
  font-size: 1em;
  max-width: 1360px;
  line-height: 150%;
}

.section-title {
  margin: 20px;
  font-size: 2em;
  font-weight: bold;
}

.conference {
  text-align: center;
  margin: 20px;
  font-size: 1.5em;
  color: #665;
}

.uns {
  text-decoration: underline;
}

.mat-icon {
  width: 0.8em;
  height: 0.8em;
  margin-right: 0.2em;
}

.teaser {
  max-width: 840px;
  margin: 0 auto;
}

.stats-img {
  height: 300px;
}

.stats-img-1 {
  max-width: 67%;
  max-height: 95%;
  object-fit: contain;
  margin: 0 auto;
  display: block;
}

.intro {
  text-align: justify;
  font-size: 1em;
  max-width: 1360px;
  line-height: 150%;
}

.link-block a {
  margin-top: 5px;
  margin-bottom: 5px;
}

.example-dialog {
  width: 800px;
}

.footer {
  color: #aaa;
  margin: 100px 0 60px 0;
}


/* The top button */
.external-link {
  display: inline-block;
  padding: 8px 16px;
  /* inner margin */
  margin: 4px;
  /* outer margin */
  border: 1px solid #9a9c9e;
  /* color of border */
  border-radius: 9px;
  background-color: #8a8b8b;
  color: white;
  text-decoration: none;
  font-size: 20px;
  transition: background-color 0.3s;
}
.conference {
  text-align: center;
  margin: 20px;
  font-size: 1.5em;
  color: #665;
}
.external-link:hover {
  background-color: #8e8f90;
}

.external-link .icon {
  margin-right: 8px;
}

.external-link .fas {
  font-size: 18px;
}

.bibtex-container {
  background-color: #e1e4e9;
  /* Change background color to match the theme */
  padding: 1em;
  /* Add padding for better readability */
  border-radius: 5px;
  /* Add border radius for rounded corners */
  text-align: left;
  white-space: pre;
  /* Preserve formatting and prevent line breaks */
  overflow-x: auto;
  /* Add horizontal scroll bar */
}

pre {
  margin: 0;
}

code {
  font-family: 'Courier New', Courier, monospace;
  /* Change font to monospace */
  color: #0a0b0b;
  /* Change text color to match the theme */
}
</style>
