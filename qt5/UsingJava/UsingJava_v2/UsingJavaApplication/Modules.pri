exists($$A_PRI_MODULE1) { include($$A_PRI_MODULE1) }
else { error(No file $$A_PRI_MODULE1) }

exists($$A_PRI_MODULE2) { include($$A_PRI_MODULE2) }
else { error(No file $$A_PRI_MODULE2) }
