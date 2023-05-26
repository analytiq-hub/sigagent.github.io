---
title: "Yann LeCun's Northeastern University Talk"
layout: post
categories: machine_learning
---

Summary of [Yann LeCun's talk at Northeastern](https://www.youtube.com/watch?v=mViTAXCg1xQ):
- He is critical of auto-regressive Large Language Models (LLMs), saying that without further improvements, the vast parameters and computational power will ultimately lead to failure.
  - Key here is `auto-regressive`. Other LLMs, with updated architecture, doing planning, chain of thought, etc - these won't necessarily have this problem
- He says auto-regressive LLMs are prone to numerous irreparable and uncontrollable hallucination errors, lacking reasoning and planning abilities.
- While auto-regressive LLMs they may approximate certain aspects of the human brain's Broca/Wernicke language areas, they fall far short of true human intelligence.

In terms of future AI development, LeCun puts forth several propositions.
- He predicts that LLM-based ChatGPT will fade into obscurity within five years.
- He emphasizes the necessity for future tech giants to prioritize the creation of open-source infrastructure for the next generation of artificial intelligence. This approach would eliminate the need for every company to compete solely based on computational power and parameter quantity.
- LeCun highlights the limitations of current AI systems, emphasizing their struggles with autonomous driving and the complexity of pharmaceutical engineering.
- As a result, AI applications remain confined to specific domains.

LeCun pointed out the significant risks associated with utilizing AI to read and write biomedical literature. LLMs can deceive laypeople by appearing knowledgeable, and even experts can detect fundamental misconceptions yet still be misled.

For professionals dedicated to fostering the healthy development of Artificial General Intelligence (AGI), LeCun offers some advice.
- He encourages them to deepen their understanding of the biological and neuroscientific foundations of animal and human learning, reasoning, and planning.
- He suggests gaining knowledge in statistical physics and quantum physics, thus establishing a robust foundation in science and technology beyond mere programming skills, which he considers to be low-level repetitive tasks that could potentially be replaced.
- He stresses the importance of cultivating critical and independent thinking to avoid succumbing to herd mentality.
- LeCun laments the numerous short-lived trends he has witnessed in the AI field, leaving behind nothing but confusion.

In terms of how models work:
- He compares supervised with unsupervised models
- Explains BERT
- Explains text-based generative models
  - Trained to predict next token (word or subword)
  - Have to train on 1-2 trillions of tokens, for the biggest models
  - With 1B to 500B parameters
  - Once trained, pass in a prompt, and use recursively to predict next, and next token. This is called auto-regressive prediction.
  - That's how all big LLMs work
    BlenderBot, Galactica, LLaMa(Meta), Alpaca(Stanford), LaMDA/Bard(Google), Chinchilla(DeepMind), ChatGPT(OpenAI), GPT-4...
- Amazing performance, stupid mistakes.
  - Factual errors, logical errors, inconsistencies, limited reasoning abilities.
  - Gullible. You can persuade them that 2+2=5.
  - Can hallucinate.
  - Not good for reasoning, planning, arithmetic
  - Can use them for writing assistance, first draft generation, code generation.
  - Software engineerig will be revolutionized.
  
- No knowledge of underlying reality.
- No common sense, no ability to plan answer (not the auto-regressive LLMs themselves)
- Auto-regressive LLMs cannot be made factual, non-toxic.
- Auto-regressive process diverges from correct answer exponentially
- Not fixable with current architecture.
- His bold prediction is that the shelf life of auto-regressive LLMs is very short.
  - 5 years from now, no one in their right mind will use them
  - Will be replaced by things that are better

- How could machines learn like animals and humans? Babies under 14 month gradually understand: (per Emmanuel Dupoux)
  - Actions: face tracking, biological motion, rational goal-directed actions
  - Physics: stability support, understanding gravity, inertia, conservation of motion
  - Objects: object permanence, solidity, rigidity, natural kind categories, shape, consistency
- How can teenagers learn to drive with 20h of practice?
- We're missing something big
- The path to general AI, to self driving cars, is not to make LLMs bigger.

- How do babies learn how the world works?
  - Largely by observation, with little interaction (initially)
  - They accummulate enormous amounts of background knowledge
    - About the structure of the world, like intuitive physics
  - Perhaps common sense emerges from this knowledge
- General intelligence will probably emerge from the ability of machines to learn how the world works by observation, the way babies and animals do it

<p align="center">
<img width="350" height="200" src="/src/images/yann_lecun/1.jpg"><br>
</p>
<p align="center">
<img width="350" height="200" src="/src/images/yann_lecun/2.jpg"><br>
</p>
<p align="center">
<img width="350" height="200" src="/src/images/yann_lecun/3.jpg"><br>
</p>
<p align="center">
<img width="350" height="200" src="/src/images/yann_lecun/4.jpg"><br>
</p>
<p align="center">
<img width="350" height="200" src="/src/images/yann_lecun/5.jpg"><br>
</p>


Andrei's take:
--------------

LeCun is Chief Scientist of Meta, and, from that position, things look different than, say, from OpenAI, or Google.

Meta is similar to OpenAI and Google in that it has a strong research-based data science group. But it is different in that it is focused on social media.

Meta does not provide cloud services like AWS and GCP, though it has a very sophisticated cloud as a back end for its multi-billion-strong user base.

Nor does Meta provide search or chatbot-based services to end users.

Meta basically sits on LLM and camera-based computer vision technology its engineers are perfectly capable to develop - but it's too preoccupied with social media competition from the likes of Tik-Tok to monetize on its internal LLM and computer vision research.

That explains LeCun's position, a bit. It's not like he's against LLMs and chat agents - or that he's dismissive of it.

What he's saying, rather, is that Meta will keep open sourcing its LLM tech stack, undercutting OpenAI and Google.

So, long term, LeCun says, we should expect LLMs and computer vision foundational algos to be commoditized, as a result of Meta's corporate strategy.
If Meta had the bandwidth to build a business around all this research it is doing, things would play out differently.

For more context on LeCun - his preprint [A Path Towards Autonomous Machine Intelligence](http://a%20path%20towards%20autonomous%20machine%20intelligence/) has a lot of stuff applicable to language models and langchain type applications.

And he's teaching an [NYU class on energy models and joint embeddings](https://cds.nyu.edu/deep-learning/).

The flavor of his work seems directed from challenges at Meta - where they sit on large amounts of text and vision data, and are looking to build self-supervised value out of that.

LeCun is also very theoretically minded. I think he might have a background in abstract math, or physics. He is a brilliant mind.
