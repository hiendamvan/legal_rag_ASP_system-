import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# =========================
# Data
# =========================

question_types = [
    "Simple",
    "Quantitative",
    "Multihop",
    "Exception",
    "Insufficient_info"
]

methods = [
    "Qwen3-1.7B",
    "RAG Baseline",
    "RAG + LLM + ASP"
]

metrics = [
    "Citation",
    "Reasoning",
    "Conclusion",
    "LLM-Judge"
]

data = {
    "Simple": {
        "Citation": [0.5231, 0.8842, 0.9186],
        "Reasoning": [0.6478, 0.9417, 0.9821],
        "Conclusion": [0.5814, 0.9185, 0.9574],
        "LLM-Judge": [0.5841, 0.9148, 0.9527],
    },
    "Quantitative": {
        "Citation": [0.4817, 0.8214, 0.8973],
        "Reasoning": [0.5936, 0.8726, 0.9415],
        "Conclusion": [0.5142, 0.8143, 0.8832],
        "LLM-Judge": [0.5298, 0.8361, 0.9073],
    },
    "Multihop": {
        "Citation": [0.3846, 0.7368, 0.8421],
        "Reasoning": [0.4921, 0.6942, 0.8147],
        "Conclusion": [0.4237, 0.7284, 0.8579],
        "LLM-Judge": [0.4335, 0.7198, 0.8382],
    },
    "Exception": {
        "Citation": [0.4173, 0.7048, 0.8139],
        "Reasoning": [0.5186, 0.6431, 0.7885],
        "Conclusion": [0.3365, 0.5876, 0.6724],
        "LLM-Judge": [0.4241, 0.6452, 0.7583],
    },
    "Insufficient_info": {
        "Citation": [0.5638, 0.9126, 0.9472],
        "Reasoning": [0.6874, 0.8738, 0.9016],
        "Conclusion": [0.6791, 0.9064, 0.9385],
        "LLM-Judge": [0.6434, 0.8976, 0.9291],
    }
}

# =========================
# Convert to long dataframe
# =========================

rows = []

for qtype in question_types:
    for metric in metrics:
        for method, score in zip(methods, data[qtype][metric]):
            rows.append({
                "Question Type": qtype,
                "Metric": metric,
                "Method": method,
                "Score": score
            })

df = pd.DataFrame(rows)

# =========================
# Plot
# =========================

sns.set_style("whitegrid")
sns.set_context("talk")

fig, axes = plt.subplots(2, 3, figsize=(25, 12)) # Adjusted for 2 rows, 3 columns

for idx, qtype in enumerate(question_types):
    row = idx // 3
    col = idx % 3
    current_ax = axes[row, col]

    plot_df = df[df["Question Type"] == qtype]

    sns.barplot(
        data=plot_df,
        x="Metric",
        y="Score",
        hue="Method",
        ax=current_ax
    )

    current_ax.set_title(qtype, fontsize=18, fontweight="bold")
    current_ax.set_ylim(0, 1.05)
    current_ax.set_xlabel("")
    current_ax.set_ylabel("Score")

    for container in current_ax.containers:
        current_ax.bar_label(container, fmt="%.2f", fontsize=9)

# Remove empty subplot (the last one in the 2x3 grid)
fig.delaxes(axes[1, 2])

# Shared legend
handles, labels = axes[0, 0].get_legend_handles_labels()

# Remove legends from individual subplots
for r in range(axes.shape[0]):
    for c in range(axes.shape[1]):
        # Only remove legend if it corresponds to an active plot
        if r * axes.shape[1] + c < len(question_types):
            ax = axes[r, c]
            legend = ax.get_legend()
            if legend is not None:
                legend.remove()

fig.legend(
    handles,
    labels,
    loc="upper center",
    ncol=3,
    fontsize=13,
    bbox_to_anchor=(0.5, 1.02)
)

plt.tight_layout()
plt.savefig("question_type_method_comparison.png", dpi=300, bbox_inches="tight")
plt.show()