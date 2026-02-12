# Macro Context: {id:<int>}

# 1️⃣ Run on_reach
$function $(on_reach) {id:$(id)}

# 2️⃣ Cleanup tags
$tag @e[tag=target_$(id)] remove target_$(id)
$tag @e[tag=reached_$(id)] remove reached_$(id)

# 3️⃣ Chain to next task (if exists)
$function phantom:internal/_task_chain {id:$(id)}
