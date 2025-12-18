<script setup>
import { Form } from '@inertiajs/vue3'
import { Link } from '@inertiajs/vue3'
import { FormInput, LoaderCircle } from "lucide-vue-next"

import InputError from "@/components/InputError.vue"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { taskPath, rootPath } from '@/routes'

const props = defineProps({
  task: Object
})
</script>
<template>
<h1>Task編集</h1>
<div class="border-b border-gray-900/10 pb-12">
  <Form
    :action="taskPath({id: task.id})"
    method="patch"
    class="flex flex-col gap-6"
    #default="{ errors, processing}"
  >
    <Label for="task[name]">タスク名: </Label>
    <input type="text" :value="task.name" name="task[name]"/>
    <Label for="task.memo">メモ: </Label>
    <input type="text" :value="task.memo" name="task[memo]"/>
    <Label for="task.deadline_at">締切日: </Label>
    <input type="date" :value="task.deadline_at" name="task[deadline_at]"/>
    <Button type="submit" :disabled="processing">
      Submit Changes
    </Button>
  </Form>
  <Link :href="rootPath">戻る</Link>
</div>
</template>
