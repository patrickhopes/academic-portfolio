# Grounding an AI Knowledge Assistant

This evaluation examines how knowledge, role, and process grounding affect answers to HR-policy questions. It distinguishes whether an assistant knows about source documents from whether it follows explicit rules for using approved sources and handling missing information.

## Deliverable

[grounding-test.docx](grounding-test.docx) contains the original configuration instructions, test log, response assessments, managerial analysis, and recommendations.

## Test design

The report covers four configurations and seven logged tests: an ungrounded baseline, a knowledge-only project, a knowledge-and-role project, and a fully grounded project. The same childcare-stipend prompt is compared across the three project configurations. The fully grounded project is then tested with supported policy questions, a missing-information question, and a different policy domain.

The process protocol requires the assistant to use approved documents, ignore drafts and rejected policies, cite the policy title and section, and return `Information not found.` when approved documents do not support an answer.

## Observed findings and scope

In the logged comparison, process grounding changed how unsupported benefits were handled. Role instructions alone did not materially change source selection. The supplied tests are a small academic evaluation rather than a broad reliability benchmark or an implemented production HR assistant.

The source HR policy documents themselves were not attached here. Their effects can be reviewed through the saved prompts and responses, but the experiment cannot be independently reproduced from this folder alone. The original report, including an unrelated external reference in the saved baseline answer, is preserved without edits.
