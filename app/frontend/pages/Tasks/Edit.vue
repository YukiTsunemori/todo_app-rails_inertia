<script setup lang="ts">
import { Form, Link } from '@inertiajs/vue3'

import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
import { rootPath, taskPath } from '@/routes'
import { Task } from "@/types"

type Props = {
  task: Task
}
const { task } = defineProps<Props>()
</script>
<template>
<h1>Task編集</h1>
<div class="border-b border-gray-900/10 pb-12">
  <Form
    :action="taskPath({id: task.id})"
    method="patch"
    class="flex flex-col gap-6"
    #default="{processing}"
  >
    <Label for="task[name]">タスク名: </Label>
    <input type="text" :value="task.name" id="task[name]" name="task[name]"/>
    <Label for="task[memo]">メモ: </Label>
    <input type="text" :value="task.memo" id="task[memo]" name="task[memo]"/>
    <Label for="task[deadline_at]">締切日: </Label>
    <input type="datetime-local" :value="task.deadline_at" id="task[deadline_at]" name="task[deadline_at]"/>
    <Button type="submit" :disabled="processing">
      Submit Changes
    </Button>
  </Form>
  <Link :href="rootPath()">戻る</Link>
</div>
</template>
