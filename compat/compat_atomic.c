#include <linux/spinlock.h>
#include <linux/module.h>

#if !((LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)) && (defined(CONFIG_UML) || defined(CONFIG_X86))) && !((LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)) && (defined(CONFIG_ARM) || defined(CONFIG_ARM64)) && !defined(CONFIG_GENERIC_ATOMIC64))

static DEFINE_SPINLOCK(lock);

#define atomic64_read LINUX_BACKPORT(atomic64_read)
long long atomic64_read(const atomic64_t *v)
{
    unsigned long flags;
    long long val;

    spin_lock_irqsave(&lock, flags);
    val = v->counter;
    spin_unlock_irqrestore(&lock, flags);
    return val;
}
EXPORT_SYMBOL_GPL(atomic64_read);

#define atomic64_add_return LINUX_BACKPORT(atomic64_add_return)
long long atomic64_add_return(long long a, atomic64_t *v)
{
    unsigned long flags;
    long long val;

    spin_lock_irqsave(&lock, flags);
    val = v->counter += a;
    spin_unlock_irqrestore(&lock, flags);
    return val;
}
EXPORT_SYMBOL_GPL(atomic64_add_return);

#endif

